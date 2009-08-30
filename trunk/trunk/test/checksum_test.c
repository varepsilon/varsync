#include "../rsync.h"

int use_random = 1;      /* TODO: may be it must be done using 
                              SUBPROTOCOL_VERSION ? */
int use_random2 = 1;

uint32 p1 = 2;
                                        // TODO: base which is not 2^n !
const uint64 base = 2147483647; /* 2^31-1 (prime)*/
const uint64 base2 = 2147483647; /* 2^31-1 (prime)*/

static uint64 powers[MAX_BLOCK_SIZE];  /* tables with powers of p1 and p2 */ 
static uint64 minuspowers[MAX_BLOCK_SIZE];  
static int32 pow_avail = 0;             /* maximum power available */
static int32 minuspow_avail = 0;             /* maximum power available */


uint32 get_checksum1(char *buf1, int32 len)
{
    if (!use_random) {    }
    else {
        int32 i;
        uint64 s;
        unsigned char *buf = (unsigned char *)buf1; 
        uint64 p = (uint64)p1;

        s = 0;
        // TODO: why do we use only one buf entry for the field element?
        // We could use up to 3 of them, because base > 2^24!

        for (i = 0; i < len; i++) {
            uint64 p_i = getpower(len - 1 - i); 
            s += (uint64)(buf[i]) * p_i;
        }
        s = mod1(s); // We could use only one mod because len <= 2^17
        return (s & 0xffffffff); 
    }
}

uint32 update_checksum1(uint32 sum0, schar *map, int32 k, int more)
{
    if (!use_random) {
            }
    else {
        uint64 minus_p1_k;   
        uint64 s = (uint64)sum0;
        unsigned char *map1 = (unsigned char *)map;

        minus_p1_k = getminuspower(k);

        // printf("minus_p1_%d = %d\n", k, minus_p1_k);

		/* Trim off the first byte from the checksum */
        /* Add on the next byte (if there is one) to the checksum */
        /* We must avoid using "-" sign due to C bug with negative residues */
		if (more) {
            s = mod1((uint64)p1 * s + minus_p1_k * (uint64)(map1[0]));
            s = mod1(s + map1[k]);
		}
        else {
            s = mod1((uint64)p1 * s + minus_p1_k * (uint64)(map1[0]));
        }
        return (uint32)(s & 0xffffffff); 
    }
}

/* 
 * Function to calculate (p1^k) % base.
 * In order to avoid recalculations powers must be calculated in advance. 
 */
uint64 getpower(int32 k)
{
   return (base - getminuspower(k));
}

/* 
 * Function to calculate (-p1^k) % base.
 * In order to avoid recalculations powers must be calculated in advance. 
 */
uint64 getminuspower(int32 k)
{
    if (minuspow_avail < BLOCK_SIZE) {
        int32 i;
        minuspowers[0] = base - 1;      /* -1 mod base */
        for (i = 0; i < BLOCK_SIZE; i++) {
            minuspowers[i+1] = mod1(minuspowers[i] * p1);
        }
        minuspow_avail = BLOCK_SIZE;
    }
    if (k <= minuspow_avail) {
        return minuspowers[k];
    }
    else {
        int32 i;
        for (i = minuspow_avail; i < k; i++) {
            minuspowers[i+1] = mod1(minuspowers[i] * p1);
        }
        minuspow_avail = k;
        return minuspowers[k];
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
            }
    else {
        uint64 s; 
        int32 i;
        unsigned char *buf1 = (unsigned char *)buf; 

        if (p == 0) {
            /* generate p */
            p = mod2(rand()); 
        }

        s = 0;
        for (i = 0; i <= len-2; i += 2) {
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
    const int32 bufsize = 25;

    uint32 randinit;
    randinit = time(0);
    srand(randinit);

    buf = calloc(sizeof(char), 2 * bufsize);
    for(i=0; i<bufsize; i++)
    {
        buf[i] = i;
    }
    for(i=0; i<bufsize; i++)
    {
        buf[i+bufsize] = i;
    }
    printf("buf = [");
    for(i=0; i< 2*bufsize; i++)
    {
        printf("%d, ", buf[i]);
    }
    printf("]\n");
    sum = get_checksum1(buf, bufsize);
    orig_sum = sum; 
    printf("Initial sum: %u\n", sum);
    p = get_checksum2(buf, bufsize, sum2, 100);
    printf("sum2 = %x\n", sum2);
    for(i=0; i<bufsize; i++)
    {
        sum = update_checksum1(sum, (schar *)(buf+i), bufsize, 1);
        sum_brute = get_checksum1(buf+i+1, bufsize);
        if (sum != sum_brute)
        {
            printf("After %d-th update: sum = %u.\n", i + 1, sum);
            printf("\tBrute method: sum_brute = %u.\n", sum_brute);
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

