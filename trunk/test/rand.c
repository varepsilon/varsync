#include <stdio.h>
#include <stdlib.h>

int main()
{
   unsigned int i,
                randInit,
                randomInit;
   
   randInit = time(0);
   randomInit = time(0);
   
   printf("initializing random number generator (rand) with %d\n",randInit);
   printf("initializing random number generator (random) with %d\n",randomInit);
   
   srand(randInit);
   srandom(randomInit);
   
   for (i=0; i<10; i++)
   {
      printf("rand()=%d \t random()=%d\n",rand(),random() );
   } 
   return (0);
}

