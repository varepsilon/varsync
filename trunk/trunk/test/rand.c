#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <stdint.h>

uint64_t base2 = 2147483647; /* prime */ 

int main()
{
   unsigned int i, randInit;
   
   randInit = time(0);
   
   printf("initializing random number generator (rand) with %d\n",randInit);
   
   srand(randInit);
   
   for (i=0; i<10; i++)
   {
      printf("rand()=%d \n",rand() % base2);
   } 
   return (0);
}

