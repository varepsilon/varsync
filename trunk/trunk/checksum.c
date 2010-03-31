/*
 * Routines to support checksumming of bytes.
 *
 * Copyright (C) 1996 Andrew Tridgell
 * Copyright (C) 1996 Paul Mackerras
 * Copyright (C) 2004-2009 Wayne Davison
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, visit the http://fsf.org website.
 */

#include "rsync.h"

extern int checksum_seed;
extern int protocol_version;
extern int use_random;      
extern int use_random2;
extern int use_cyclic;      

int csum_length = SHORT_SUM_LENGTH; /* initial value */
extern uint32 p1;

const uint64 base = 2147483647;  /* prime, equals 2^31-1 */  
const uint64 base2 = 2147483647; /* prime, equals 2^31-1 */  

static uint64 powers[MAX_BLOCK_SIZE];  /* tables with powers of p1 */ 
static int32 pow_avail = 0;             /* maximum power available */

/* table for get_transformation */
static uint32 transformation_table[UCHAR_MAX + 1];
/* table for shifts */
static uint32 shifted_transformation_table[UCHAR_MAX + 1];
/* maximum transformation_table index that has been precalculated */
static int32 transformations_avail = 0;


/*
  1) A simple 32 bit checksum that can be updated from either end
  (inspired by Mark Adler's Adler-32 checksum)
  2) Random-based polynomial checksum with the same rolling property
  (inspired by famous communication complexity problem of file comparison)
*/
uint32 get_checksum1(char *buf1, int32 len)
{
    if (!use_random && !use_cyclic) { /* original sum */
        int32 i;
        uint32 s1, s2;
        schar *buf = (schar *)buf1; /* signed char */

        s1 = s2 = 0;
        for (i = 0; i < (len-4); i += 4) {
            s2 += 4*(s1 + buf[i]) + 3*buf[i+1] + 2*buf[i+2] + buf[i+3] +
                10*CHAR_OFFSET;
            s1 += (buf[i+0] + buf[i+1] + buf[i+2] + buf[i+3] + 4*CHAR_OFFSET);
        }
        for (; i < len; i++) {
            s1 += (buf[i]+CHAR_OFFSET); s2 += s1;
        }
        return (s1 & 0xffff) | (s2 << 16);
    } else if (use_random) {
        int32 i;
        uint64 s;
        unsigned char *buf = (unsigned char *)buf1; 
        uint64 p = (uint64)p1;
        uint64 p_2 = mod1(p * p);        /* p squared */
        uint64 p_3 = mod1(p_2 * p);
        uint64 p_4 = mod1(p_3 * p);

        s = 0;
        // TODO: why do we use only one buf entry for the field element?
        // We could use up to 3 of them, because base > 2^24!
        for (i = 0; i < (len - 4); i += 4) {
            s = s * p_4 + (uint64)(buf[i+0]) * p_3 + 
                (uint64)(buf[i+1]) * p_2 + (uint64)(buf[i+2]) * p + 
                (uint64)(buf[i+3]);
            s = mod1(s);
        }
        for (; i < len; i++) {
            s = s * p + (uint64)(buf[i]);
            s = mod1(s);
        }
        return s & 0xffffffff; 
    } else /* if (use_cyclic) */ {
        int32 i;
        unsigned char *buf = (unsigned char *)buf1;
        uint32 s = 0;
        for (i = 0; i < len; i++) {
            s = brotl(s, 1);
            s ^= get_transformation(buf[i], len);
        }
        return s & 0xffffffff;
    }
}

uint32 update_checksum1(uint32 sum0, schar *map, int32 k, int more)
{
    if (!use_random && !use_cyclic) { /* original sum */
        uint32 s1, s2;
        s1 = sum0 & 0xffff;
        s2 = sum0 >> 16;
        /* Trim off the first byte from the checksum */
        s1 -= map[0] + CHAR_OFFSET;
        s2 -= k * (map[0] + CHAR_OFFSET);

        /* Add on the next byte (if there is one) to the checksum */
        if (more) {
          s1 += map[k] + CHAR_OFFSET;
          s2 += s1;
        }
        return (s1 & 0xffff) | (s2 << 16);
    } else if (use_random) {
        uint64 minus_p1_k;   
        uint64 s = (uint64)sum0;
        unsigned char *map1 = (unsigned char *)map;

        minus_p1_k = getminuspower(k);

        /* Trim off the first byte from the checksum */
        /* Add on the next byte (if there is one) to the checksum */
        /* We must avoid using minus sign due to C bug with negative residues */
        if (more) {
          s = mod1((uint64)p1 * s + minus_p1_k * (uint64)(map1[0]) + map1[k]);
        }
        else {
            s = mod1((uint64)p1 * s + minus_p1_k * (uint64)(map1[0]));
        }
        return (uint32)(s & 0xffffffff);
    } else /* if (use_cyclic) */ {
        unsigned char *map1 = (unsigned char *)map;
        sum0 = brotl(sum0, 1);
        sum0 ^= get_shifted_transformation(map1[0], k);
        if (more) {
            sum0 ^= get_transformation(map1[k], k);
        }
        return sum0 & 0xffffffff;
    }
}

/* 
 * Function to calculate (-p1^k) % base.
 * In order to avoid recalculations powers must be calculated in advance. 
 */
uint64 getminuspower(int32 k)
{
    if (pow_avail < BLOCK_SIZE) {
        int32 i;
        powers[0] = base - 1;      /* -1 mod base */
        for (i = 0; i < BLOCK_SIZE; i++) {
            powers[i+1] = mod1(powers[i] * p1);
        }
        pow_avail = BLOCK_SIZE;
    }
    if (k <= pow_avail) {
        return powers[k];
    }
    else {
        int32 i;
        for (i = pow_avail; i < k; i++) {
            powers[i+1] = mod1(powers[i] * p1);
        }
        pow_avail = k;
        return powers[k];
    }
}

/*
* Pseudo-random map: unsigned char -> uint32
*/
uint32 get_transformation(unsigned char c, int32 block_len)
{
    if (transformations_avail < UCHAR_MAX) {
        fill_transformation_tables(block_len);
    }
    return transformation_table[c];
}

/*
* Shifted transformation_table for update_checksum1
*/
uint32 get_shifted_transformation(unsigned char c, int32 block_len)
{
    if (transformations_avail < UCHAR_MAX) {
        fill_transformation_tables(block_len);
    }
    return shifted_transformation_table[c];
}

/*
* Implement memoization for get_*_transformation(...)
*/
void fill_transformation_tables(int32 block_len)
{
    int32 i;
    srand(CYCLIC_SUM_SEED_VALUE);
    for (i = 0; i <= UCHAR_MAX; i++) {
        transformation_table[i] = rand();
        shifted_transformation_table[i] =
            brotl(transformation_table[i], block_len); 
    }
    transformations_avail = UCHAR_MAX;
}

/*
* Perform bitwise left rotation
*/

uint32 brotl(uint32 value, int32 shift) 
{
    return (value << shift % 32) ^ (value >> (32 - shift % 32));
}


/* 1) md5/md4 checksum will be written in the sum buffer and 0 will be
 * returned (p is ignored).
 * 2) Random-based checksum calculated in the point p will be written in the
 * sum buffer. 
 * If p is equal to 0 it will be random-generated
 */

uint32 get_checksum2(char *buf, int32 len, char *sum, uint32 p1)
{
    if (!use_random2) { 
        md_context m;

        if (protocol_version >= 30) {
            uchar seedbuf[4];
            md5_begin(&m);
            md5_update(&m, (uchar *)buf, len);
            if (checksum_seed) {
                SIVAL(seedbuf, 0, checksum_seed);
                md5_update(&m, seedbuf, 4);
            }
            md5_result(&m, (uchar *)sum);
        } else {
            int32 i;
            static char *buf1;
            static int32 len1;

            mdfour_begin(&m);

            if (len > len1) {
                if (buf1)
                    free(buf1);
                buf1 = new_array(char, len+4);
                len1 = len;
                if (!buf1)
                    out_of_memory("get_checksum2");
            }

            memcpy(buf1, buf, len);
            if (checksum_seed) {
                SIVAL(buf1,len,checksum_seed);
                len += 4;
            }

            for (i = 0; i + CSUM_CHUNK <= len; i += CSUM_CHUNK)
                mdfour_update(&m, (uchar *)(buf1+i), CSUM_CHUNK);

            /*
             * Prior to version 27 an incorrect MD4 checksum was computed
             * by failing to call mdfour_tail() for block sizes that
             * are multiples of 64.  This is fixed by calling mdfour_update()
             * even when there are no more bytes.
             */
            if (len - i > 0 || protocol_version >= 27)
                mdfour_update(&m, (uchar *)(buf1+i), len-i);

            mdfour_result(&m, (uchar *)sum);
        }
        return 0;
    }
    else {
        uint64 s; 
        int32 i;
        unsigned char *buf1 = (unsigned char *)buf;
        uint64 p, p_2, p_3, p_4;

        if (p1 == 0) {
            /* generate p1 */
            p1 = mod2(rand()); 
        }
        
        p = (uint64)p1;
        p_2 = mod2(p * p);
        p_3 = mod2(p_2 * p);
        p_4 = mod2(p_3 * p);

        s = 0;
        for (i = 0; i < (len - 8); i+=8) {
            s = s * p_4 + (uint64)PVAL(buf1, i+0) * p_3 + 
                (uint64)PVAL(buf1, i+2) * p_2 + (uint64)PVAL(buf1, i+4) * p + 
                (uint64)PVAL(buf1, i+6);
            s = mod2(s);
        }

        for (; i <= len-2; i+=2) {
            /* convert 2 adjacent bytes to uint16 using PVAL */
            s = mod2((uint64)p * s + (uint64)PVAL(buf1, i));
        }
        if (len % 2) {
            /* if len % 2 we can't use PVAL! */
            s = mod2((uint64)p * s + (uint64)(buf1[i]));
        }
        /* here we assume that RANDOM_SUM_LENGTH == 4 */
        SIVAL(sum, 0, s);
        return p;
    }
}

/* Get residue modulo base. Optimized version */
/* NOTE: works only for base = 2^31 - 1 */
uint64 mod1(uint64 x)
{
    while (x > base) {
        uint32 a;
        uint32 b;
        a = x >> 31;   /* IMPORTANT: a != 0 */  
        b = x & 0x7fffffff;
        x = a + b;
    }
    if (x == base) {
        return 0;
    }
    return x; 
}

/* Get residue modulo base2. Optimized version */
/* NOTE: works only for base2 = 2^31 - 1 */
uint64 mod2(uint64 x)
{
    while (x > base2) {
        uint32 a;
        uint32 b;
        a = x >> 31;   /* IMPORTANT: a != 0 */  
        b = x & 0x7fffffff;
        x = a + b;
    }
    if (x == base2) {
        return 0;
    }
    return x; 
}

void file_checksum(char *fname, char *sum, OFF_T size)
{
	struct map_struct *buf;
	OFF_T i, len = size;
	md_context m;
	int32 remainder;
	int fd;

	memset(sum, 0, MAX_DIGEST_LEN);

	fd = do_open(fname, O_RDONLY, 0);
	if (fd == -1)
		return;

	buf = map_file(fd, size, MAX_MAP_SIZE, CSUM_CHUNK);

	if (protocol_version >= 30) {
		md5_begin(&m);

		for (i = 0; i + CSUM_CHUNK <= len; i += CSUM_CHUNK) {
			md5_update(&m, (uchar *)map_ptr(buf, i, CSUM_CHUNK),
				   CSUM_CHUNK);
		}

		remainder = (int32)(len - i);
		if (remainder > 0)
			md5_update(&m, (uchar *)map_ptr(buf, i, remainder), remainder);

		md5_result(&m, (uchar *)sum);
	} else {
		mdfour_begin(&m);

		for (i = 0; i + CSUM_CHUNK <= len; i += CSUM_CHUNK) {
			mdfour_update(&m, (uchar *)map_ptr(buf, i, CSUM_CHUNK),
				      CSUM_CHUNK);
		}

		/* Prior to version 27 an incorrect MD4 checksum was computed
		 * by failing to call mdfour_tail() for block sizes that
		 * are multiples of 64.  This is fixed by calling mdfour_update()
		 * even when there are no more bytes. */
		remainder = (int32)(len - i);
		if (remainder > 0 || protocol_version >= 27)
			mdfour_update(&m, (uchar *)map_ptr(buf, i, remainder), remainder);

		mdfour_result(&m, (uchar *)sum);
	}

	close(fd);
	unmap_file(buf);
}

static int32 sumresidue;
static md_context md;

void sum_init(int seed)
{
	char s[4];

	if (protocol_version >= 30)
		md5_begin(&md);
	else {
		mdfour_begin(&md);
		sumresidue = 0;
		SIVAL(s, 0, seed);
		sum_update(s, 4);
	}
}

/**
 * Feed data into an MD4 accumulator, md.  The results may be
 * retrieved using sum_end().  md is used for different purposes at
 * different points during execution.
 *
 * TODO Perhaps get rid of md and just pass in the address each time.
 * Very slightly clearer and slower.
 **/
void sum_update(const char *p, int32 len)
{
	if (protocol_version >= 30) {
		md5_update(&md, (uchar *)p, len);
		return;
	}

	if (len + sumresidue < CSUM_CHUNK) {
		memcpy(md.buffer + sumresidue, p, len);
		sumresidue += len;
		return;
	}

	if (sumresidue) {
		int32 i = CSUM_CHUNK - sumresidue;
		memcpy(md.buffer + sumresidue, p, i);
		mdfour_update(&md, (uchar *)md.buffer, CSUM_CHUNK);
		len -= i;
		p += i;
	}

	while (len >= CSUM_CHUNK) {
		mdfour_update(&md, (uchar *)p, CSUM_CHUNK);
		len -= CSUM_CHUNK;
		p += CSUM_CHUNK;
	}

	sumresidue = len;
	if (sumresidue)
		memcpy(md.buffer, p, sumresidue);
}

int sum_end(char *sum)
{
	if (protocol_version >= 30) {
		md5_result(&md, (uchar *)sum);
		return MD5_DIGEST_LEN;
	}

	if (sumresidue || protocol_version >= 27)
		mdfour_update(&md, (uchar *)md.buffer, sumresidue);

	mdfour_result(&md, (uchar *)sum);

	return MD4_DIGEST_LEN;
}


