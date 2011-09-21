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

int is_pandigital(int n)
{
	int len = ((int)log10(n))+1;
	char str[len];
	sprintf(str, "%i", n);
	int i;
	for (i = 1; i <= len; i++)
	{
		if (NULL == strchr(str, i+'0')) 
		{
			return 0;
		}
	}
	return 1;
}

int main()
{
	int i, k;
	int max = 0;
	for (i = 101; i < 7654321; i+=2)
	{
		if ((is_prime(i)) && (is_pandigital(i)))
		{
			if (i > max) {max=i;}
		}
		k++;
		if (0 == k % 100000) {printf("%i %i %i\n", k, i, max);}
	}
	printf("%i\n", max);
	return 0;	
}
