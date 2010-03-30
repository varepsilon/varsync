#include "../rsync.h"
#include "../proto.h"

int use_random = 0;      /* TODO: may be it must be done using 
                              SUBPROTOCOL_VERSION ? */
int use_cyclic = 1;

uint32 p1 = 2;
                                        // TODO: base which is not 2^n !
const uint64 base = 2147483647; /* 2^31-1 (prime)*/
const uint64 base2 = 2147483647; /* 2^31-1 (prime)*/

static uint64 powers[MAX_BLOCK_SIZE];  /* tables with powers of p1 and p2 */ 
static uint64 minuspowers[MAX_BLOCK_SIZE];  
static int32 pow_avail = 0;             /* maximum power available */
static int32 minuspow_avail = 0;             /* maximum power available */

/* table for get_transformation */
static uint32 transformation_table[UCHAR_MAX+1];
/* table for shifts */
static uint32 shifted_transformation_table[UCHAR_MAX+1];
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
            s <<= 1;
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
        /* We must avoid using "-" sign due to C bug with negative residues */
		if (more) {
            s = mod1((uint64)p1 * s + minus_p1_k * (uint64)(map1[0]) + map1[k]);
		}
        else {
            s = mod1((uint64)p1 * s + minus_p1_k * (uint64)(map1[0]));
        }
        return (uint32)(s & 0xffffffff);
    } else /* if (use_cyclic) */ {
        unsigned char *map1 = (unsigned char *)map;
//        printf("sum0 == %u\n", sum0);
        sum0 <<= 1;
//        printf("sum0 == %u\n", sum0);
        sum0 ^= get_shifted_transformation(map1[0], k);
//        printf("sum0 == %u\n", sum0);
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
//    printf("shifted[%d] == %u\n", c, shifted_transformation_table[c]);
    return shifted_transformation_table[c];
}

/*
* Implement memoization for get_*_transformation(...)
*/
void fill_transformation_tables(int32 block_len)
{
    int32 i;
    printf("SRAND\n");
    srand(CYCLIC_SUM_SEED_VALUE);
    for (i = 0; i <= UCHAR_MAX; i++) {
        transformation_table[i] = rand();
        shifted_transformation_table[i] = block_len < 32 ?
            transformation_table[i] << block_len : 0;
    }
    transformations_avail = UCHAR_MAX;
}

/* 1) md5/md4 checksum will be written in the sum buffer and 0 will be
 * returned (p is ignored).
 * 2) Random-based checksum calculated in the point p will be written in the
 * sum buffer. 
 * If p is equal to 0 it will be random-generated
 */

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

int main(int argc,char *argv[])
{
    int32 i;
    uint32 tst;
    uint64_t maxNum = UINT64_MAX;
    char *buf;
    char sum2[16];
    uint32 sum;
    uint32 sum_brute; 
    uint32 orig_sum;
    uint32 p;
    const int32 bufsize = 1256;

    uint32 randinit;
    randinit = time(0);
    srand(randinit);

    buf = calloc(sizeof(char), 2 * bufsize);
    for (i = 0; i < bufsize; i++)
    {
        buf[i] = (char)i;
    }
    for (i = 0; i < bufsize; i++)
    {
        buf[i + bufsize] = (char)i;
    }
    printf("buf = [");
    for (i = 0; i < 2 * bufsize; i++)
    {
        printf("%d, ", buf[i]);
    }
    printf("]\n");
    sum = get_checksum1(buf, bufsize);
    orig_sum = sum; 
    printf("Initial sum: %u\n", sum);
    for (i = 0; i < bufsize; i++)
    {
        sum = update_checksum1(sum, (schar *)(buf+i), bufsize, 1);
        sum_brute = get_checksum1(buf+i+1, bufsize);
        if (sum != sum_brute)
        {
            printf("After %d-th update: sum = %u.\n", i + 1, sum);
            printf("\tBrute method: sum_brute = %u.\n", sum_brute);
//            printf("\tT[buf[i]] = %d\n", get_transformation(buf[i], bufsize));
        }
    }
    // tst = (((base-1)*(base-2))%base + ((base-1)*(base-1))%base) % base;
    // printf (" SEE: 3 == %d\n", tst);
    // printf("max uint64_t value in hex is %016" PRIx64 "\n", maxNum);
    // printf("%u = %x\n", base2, base2);
    // printf("SIZEOF_INT32 = %d\n", SIZEOF_INT32);
    free(buf);
    return 0;
}

