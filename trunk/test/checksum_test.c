#include "../rsync.h"

int use_random = 1;      /* TODO: may be it must be done using 
                              SUBPROTOCOL_VERSION ? */
int use_random2 = 1;

int csum_length = SHORT_SUM_LENGTH; /* initial value */
uint32 p1 = 2;
uint32 p2 = 3;
const uint32 base = 65537;  /* 2^16+1 (prime) */     
                                        // TODO: base which is not 2^n !
const uint32 base2 = 2147483647; /* 2^31-1 (prime)*/

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
    else
    {
        /* TODO:  base must be chosen in a more cleaver way
         */
                              
        int32 i;
        uint32 s1, s2;
        schar *buf = (schar *)buf1; 

        s1 = s2 = 0;
        for (i = 0; i < len; i++) {
            // printf("Partial: s1 = %ld, s2 = %ld...\n", s1, s2);
            s1 = (p1 * s1 + buf[i]) % base;
            s2 = (p2 * s2 + buf[i]) % base;
        }
        return (s1 & 0xffff) + (s2 << 16);
    }
}

uint32 update_checksum1(uint32 s1, uint32 s2, schar *map, int32 k, int more)
{
    if (!use_random) {
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
        uint32 p1_k = 1;   // p_1 to the power of k
        uint32 p2_k = 1;
        p1_k = getpower(1, k);
        p2_k = getpower(2, k); 

        printf("p1_k = %d, map[0] = %d, map[k] = %d\n", 
                p1_k, map[0], map[k]);
 
        s1 = (s1 * p1 - p1_k * map[0]) % base;
        s2 = (s2 * p2 - p2_k * map[0]) % base;

        /* Add on the next byte (if there is one) to the checksum */
		if (more) {
			s1 = (s1 + map[k]) % base;
			s2 = (s2 + map[k]) % base;
		}
        return (s1 & 0xffff) | (s2 << 16);
    }
}

/* 1) md5/md4 checksum will be written in the sum buffer and 0 will be
 * returned (p is ignored).
 * 2) Random-based checksum calculated in the point p will be written in the sum buffer. If p is equal to 0 it will be random-generated.

 */

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
            uint32 randinit;
            randinit = time(0);
            srand(randinit);
            p = rand() % base2;
        }

        s = 0;
        for (i = 0; i < len; i++) {
            s = (p * s + buf1[i]) % base2;
        }
        printf("s = %u\n", s);
        snprintf(sum, RANDOM_SUM_LENGTH+1, "%016x", s);
        return p;
    }
}

/* In order to avoid recalculations powers must be calculated in advance */
uint32 getpower(int j, int32 k)
{
    if (pow_avail < BLOCK_SIZE) {
        int32 i;
        powers[0][0] = 1;
        powers[1][0] = 1;
        for (i = 0; i < BLOCK_SIZE; i++) {
            powers[0][i+1] = (powers[0][i] * p1) % base;
            powers[1][i+1] = (powers[1][i] * p2) % base;
        }
        pow_avail = BLOCK_SIZE;
    }
    if (k > pow_avail) {
        int32 i;
        for (i = pow_avail; i < k; i++) {
            powers[0][i+1] = (powers[0][i] * p1) % base;
            powers[1][i+1] = (powers[1][i] * p2) % base;
        }
        pow_avail = k;
    }
    return powers[j-1][k];
}


int main(int argc,char *argv[])
{
    int32 i;
    char *buf;
    char sum2[16];
    uint32 sum, s1, s2;
    uint32 sum_brute, s1_brute, s2_brute;
    uint32 orig_s1, orig_s2;
    uint32 p;
    const int32 bufsize = 20;
    // printf ("(-1) %% 5 = %d\n", (-1) % 5);

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
    orig_s1 = s1 = sum & 0xffff;
    orig_s2 = s2 = sum >> 16; 
    printf("Initial sums: s1 = %u, s2 = %u\n", s1, s2);
    p = get_checksum2(buf, bufsize, sum2, 100);
    printf("sum2 = %s\n", sum2);
    for(i=0; i<bufsize; i++)
    {
        sum = update_checksum1(s1, s2, (schar *)(buf+i), bufsize, 1);
        s1 = sum & 0xffff;
        s2 = sum >> 16; 
        sum_brute = get_checksum1(buf+i+1, bufsize);
        s1_brute = sum_brute & 0xffff;
        s2_brute = sum_brute >> 16;
        printf("After %d-th update: s1 = %u, s2 = %u.\n", i+1, s1, s2);
        printf("\tBrute method: s1_brute = %u, s2_brute = %u.\n",
                s1_brute, s2_brute);
    }
    printf("Compare with the original: s1 = %u, s2 = %u\n", 
            orig_s1, orig_s2);
    free(buf);
    return 0;
}

