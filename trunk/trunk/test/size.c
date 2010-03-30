#include <stdio.h>
#include <stdint.h>
#include "../rsync.h"

int main(int argc, char* argv[])
{
    uint32_t x = 251;
    x <<= 31;
//    x ^= 3;
    printf("sizeof(int32) == %d\n", sizeof(int32_t));
    printf("UCHAR_MAX = %d\n", UCHAR_MAX);
    printf("%u\n", x);
    return 0;
}
