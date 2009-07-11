#include "../rsync.h"

int use_random = 1;
int protocol_version = PROTOCOL_VERSION;

const int p1 = 2;
const int p2 = 3;
const uint32 base = 1<<16;        // base which is not power of 2 may cause
                                  // problems
static uint32 powers1[MAX_BLOCK_SIZE]; /* static variables are initialized by zeroes */
static uint32 powers2[MAX_BLOCK_SIZE];


/*
  a simple 32 bit checksum that can be updated from either end
  (inspired by Mark Adler's Adler-32 checksum)
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
        /* TODO:    1) base must be chosen in a more cleaver way
         *          2) p1 and p2 must be generated _randomly_ by
         *              _client_ and then sent to server.
         */
                              
        int32 i;
        uint32 s1, s2;
        schar *buf = (schar *)buf1; // signed char

        // TODO: optimisation is needed
        s1 = s2 = 0;
        for (i = 0; i < len; i++) {
            s1 = (p1 * s1 + buf[i]) % base;
            s2 = (p2 * s2 + buf[i]) % base;
        }
        return (s1 & 0xffff) + (s2 << 16);
    }
}

// TODO optimisation really needed
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
        // TODO: replace this by real code
        uint32 p1_k = 1;   // p_1 to the power of k
        uint32 p2_k = 1;
        int32 i;
        /* for (i = 0; i < k; i++) {
            p1_k = (p1_k * p1) % base;
            p2_k = (p2_k * p2) % base;
        } */
        p1_k = getpower1(k);
        p2_k = getpower1(k); // TODO:

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

uint32 getpower1(int32 k)
{
    if (powers1[k] != 0) {
        return powers1[k];
    }
    else if (k == 0) {
        powers1[k] = 1;
        return 1;
    }
    else {
        powers1[k] = (p1 * getpower1(k-1)) % base;
        return powers1[k];
    }
}

uint32 getpower2(int32 k)
{
    if (powers2[k] != 0) {
        return powers2[k];
    }
    else if (k == 0) {
        powers2[k] = 1;
        return 1;
    }
    else {
        powers2[k] = (p2 * getpower2(k-1)) % base;
        return powers2[k];
    }
}

int main(int argc,char *argv[])
{
    int i;
    char *buf;
    int32 sum, s1, s2;
    const int bufsize = 5;
    buf = calloc(sizeof(char), bufsize + 1);
    for(i=0; i<bufsize; i++)
    {
        buf[i] = i;
    }
    buf[bufsize] = bufsize; // for testing rolling property
    
    //calculate initial sum
    sum = get_checksum1(buf, bufsize);
    s1 = sum & 0xffff;
    s2 = sum >> 16; 
    printf("s1 = %d, s2 = %d\n", s1, s2);
    
    //now update it:
    sum = update_checksum1(s1, s2, buf, bufsize, 1);
    s1 = sum & 0xffff;
    s2 = sum >> 16; 
    printf("After update: s1 = %d, s2 = %d\n", s1, s2);
    free(buf);
    return 0;
}
