#include "../rsync.h"

int use_random = 1;      /* TODO: may be it must be done using 
                              SUBPROTOCOL_VERSION ? */
int use_random2 = 1;

uint32 p1 = 2147483646;
                                        // TODO: base which is not 2^n !
const uint64 base = 2147483647; /* 2^31-1 (prime)*/
const uint64 base2 = 2147483647; /* 2^31-1 (prime)*/

static uint64 powers[MAX_BLOCK_SIZE];  /* tables with powers of p1 and p2 */ 
static int32 pow_avail = 0;             /* maximum power available */


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
        return (s1 & 0xffff) | (s2 << 16);
    }
    else {
        int32 i;
        uint64 s;
        unsigned char *buf = (unsigned char *)buf1; 

        s = 0;
        for (i = 0; i < len; i+=2) {
            // TODO: why do we use only one buf entry for the field element?
            // We could use up to 3 of them, because base > 2^24!
            s = mod1((uint64)p1 * s + (uint64)PVAL(buf, i));
        }
        return (s & 0xffffffff); 
    }
}

uint32 update_checksum1(uint32 sum0, schar *map, int32 k, int more, OFF_T *step)
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
        *step = 1; /* we used only one byte from map */
        return (s1 & 0xffff) | (s2 << 16);
    }
    else {
        uint64 minus_p1_k;   
        uint64 s = (uint64)sum0;
        unsigned char *map1 = (unsigned char *)map;

        minus_p1_k = getminuspower(k);

        /* We must avoid using "-" sign due to C bug with negative residues */
        s = mod1((uint64)p1 * s + minus_p1_k * (uint64)PVAL(map1, 0));

        /* Add on the next byte/bytes (if there is any) to the checksum */
		if (more) {
			s = mod1(s + PVAL(map1, k));
		}
        *step = 2;
        return (uint32)(s & 0xffffffff); 
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

uint32 get_checksum2(char *buf, int32 len, char *sum, uint32 p)
{
    if (!use_random2) { 
       return 0;
    }
    else {
        uint32 s;
        int32 i;
        schar *buf1 = (schar *)buf; 

        if (p == 0) {
            /* generate p */
            p = rand() % base2;
        }

        s = 0;
        for (i = 0; i < len; i++) {
            s = ((p * s) % base2 + buf1[i]) % base2;
        }
        snprintf(sum, 8+1, "%08x", s);
        return p;
    }
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
    const int32 bufsize = 10;

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
    printf("sum2 = %s\n", sum2);
    for(i=0; i<bufsize; i+=2)
    {
        OFF_T step;
        sum = update_checksum1(sum, (schar *)(buf+i), bufsize, 1, &step);
        sum_brute = get_checksum1(buf+i+2, bufsize);
        if (sum != sum_brute)
        {
            printf("After %d-th update: sum = %u.\n", i+1, sum);
            printf("\tBrute method: sum_brute = %u.\n", sum_brute);
        }
    }
    tst = (((base-1)*(base-2))%base + ((base-1)*(base-1))%base) % base;
    // printf (" SEE: 3 == %d\n", tst);
    printf("max uint64_t value in hex is %016" PRIx64 "\n", maxNum);
    printf("%u = %x\n", base2, base2);
    printf("SIZEOF_INT32 = %d\n", SIZEOF_INT32);
    free(buf);
    return 0;
}

