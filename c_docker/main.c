
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
    printf(" ****** this is c test ******* \n");
    while(1)
        printf("%d\n", getpid());
}