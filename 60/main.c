#include <math.h>
#include <stdio.h>
#include <string.h>

int is_prime(int n)
{
	if (0 == n%2) {return 0;}
	int isqr = (int)sqrt(n);
	int i;
	for (i = 3; i < isqr; i+=2)
	{
		if (0 == n%i) {return 0;}
	}
	return 1;
}

int main()
{
	printf("%i\n", max);
	return 0;	
}
