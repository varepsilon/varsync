#include <stdint.h>
#include <math.h>
int main()
{
    uint32_t base = (1<<16) - 1;
    uint32_t x = 429496729;     /* TODO problems with big x and
                                   base != power of two */
    printf("%u mod %u = %u\n", x, base, x % base);
    printf("%d\n", (int)pow(0,4));
    return 0;
}

