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

int csum_length = SHORT_SUM_LENGTH; /* initial value */
extern uint32 p1;
extern uint32 p2;

const uint32 base = 65521;  /* prime, equals 2^16-15 */     
const uint64 base2 = 2147483647; /* prime, equals 2^31-1 */ 

static uint32 powers[2][MAX_BLOCK_SIZE];  /* tables with powers of p1 and p2 */ 
static int32 pow_avail = 0;             /* maximum power available */


/*
  1) A simple 32 bit checksum that can be updated from either end
  (inspired by Mark Adler's Adler-32 checksum)
  2) Random-based polynomial checksum with the same rolling property
  (inspired by famous communication complexity problem of file comparison)
*/
uint32 get_checksum1(char *buf1, int32 len)
{
    if (!use_random) {
        int32 i;
        uint32 s1, s2;
        schar *buf = (schar *)buf1; //signed char

        s1 = s2 = 0;
        /* Note, that this cycle is skilfully fucked but almost coincide
         * with the original one
         */
        for (i = 0; i < (len-4); i+=4) {
            s2 += 4*(s1 + buf[i]) + 3*buf[i+1] + 2*buf[i+2] + buf[i+3] +
                10*CHAR_OFFSET;
            s1 += (buf[i+0] + buf[i+1] + buf[i+2] + buf[i+3] + 4*CHAR_OFFSET);
        }
        for (; i < len; i++) {
            s1 += (buf[i]+CHAR_OFFSET); s2 += s1;
        }
        return (s1 & 0xffff) + (s2 << 16);
    }
    else {
        int32 i;
        uint32 s1, s2;
        unsigned char *buf = (unsigned char *)buf1; 

        s1 = s2 = 0;
        for (i = 0; i < len; i++) {
            s1 = mod1(mod1(p1 * s1) + buf[i]);
            s2 = mod1(mod1(p2 * s2) + buf[i]);
        }
        return (s1 & 0xffff) + (s2 << 16);
    }
}

uint32 update_checksum1(uint32 sum0, schar *map, int32 k, int more)
{
    if (!use_random) {
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
    }
    else {
        uint32 s1, s2;
        s1 = sum0 & 0xffff;
        s2 = sum0 >> 16;
        uint32 minus_p1_k;   
        uint32 minus_p2_k;
        unsigned char *map1 = (unsigned char *)map;

        minus_p1_k = getminuspower(1, k);
        minus_p2_k = getminuspower(2, k); 

        /* We must avoid using "-" sign due to C bug with negative residues */
        s1 = mod1(mod1(s1 * p1) + mod1(minus_p1_k * map1[0]));
        s2 = mod1(mod1(s2 * p2) + mod1(minus_p2_k * map1[0]));

        /* Add on the next byte (if there is one) to the checksum */
		if (more) {
			s1 = mod1(s1 + map1[k]);
			s2 = mod1(s2 + map1[k]);
		}
        return (s1 & 0xffff) | (s2 << 16);
    }
}

/* 
 * Function to calculate (-p1^k) % base.
 * In order to avoid recalculations powers must be calculated in advance. 
 */
uint32 getminuspower(int j, int32 k)
{
    if (pow_avail < BLOCK_SIZE) {
        int32 i;
        powers[0][0] = base - 1;      /* -1 mod base */
        powers[1][0] = base - 1;
        for (i = 0; i < BLOCK_SIZE; i++) {
            powers[0][i+1] = mod1(powers[0][i] * p1);
            powers[1][i+1] = mod1(powers[1][i] * p2);
        }
        pow_avail = BLOCK_SIZE;
    }
    if (k <= pow_avail) {
        return powers[j-1][k];
    }
    else {
        int32 i;
        for (i = pow_avail; i < k; i++) {
            powers[0][i+1] = mod1(powers[0][i] * p1);
            powers[1][i+1] = mod1(powers[1][i] * p2);
        }
        pow_avail = k;
        return powers[j-1][k];
    }
}

/* 1) md5/md4 checksum will be written in the sum buffer and 0 will be
 * returned (p is ignored).
 * 2) Random-based checksum calculated in the point p will be written in the
 * sum buffer. 
 * If p is equal to 0 it will be random-generated
 */

uint32 get_checksum2(char *buf, int32 len, char *sum, uint32 p)
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

        if (p == 0) {
            /* generate p */
            uint32 randinit;
            randinit = time(0);
            srand(randinit);
            p = mod2(rand()); 
        }

        s = 0;
        for (i = 0; i < len; i++) {
            s = mod2(mod2((uint64)p * s) + (uint64)(buf1[i]));
        }
        /* snprintf takes '\0' into account */
        snprintf(sum, RANDOM_SUM_LENGTH+1, "%016" PRIx64, s);    
        return p;
    }
}

/* Get residue modulo base. Optimized version */
/* NOTE: works only for base = 2^16 - 15 */
uint32 mod1(uint32 x)
{
   while (x >= 65536) {
        uint32 a;
        uint32 b;
        a = x >> 16;   /* IMPORTANT: a != 0 */  
        b = x & 0xffff;
        x = (a << 4) + b - a;
    }
    if (x >= base) {
        return (x - base);
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


