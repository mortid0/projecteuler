#include <stdio.h>
#include <math.h>

long long int power(int a, int n)
{
	if (0 == n) {return 1;}
	if (1 == n) {return a;}
	if (0 == n%2 ) 
	{
		long long int a2 = pow(a, n/2); 
		return a2*a2;
	}
	else
	{
		long long int a2 = pow(a, n/2);
		return a*a2*a2;
	}
}

int length(long long int n)
{
	return (((int)log10(n))+1);
}

int main()
{
	int i, j, sum, ln;
	sum = 0;
	i = 2;
	for (i = 2; i < 10; i++)
	{
		for (j = 2; j < 30; j++)
		{
			ln = length(power(i, j));
			if (ln == j) {sum++; printf("i %i j %i power %lld len %i\n", i, j, power(i, j), ln);}
		}
	}
	long long int p = power(9, 20);
	printf("i %i j %i power %lld len %i\n", 9, 20, p, length(p));
	printf("%i\n", sum);
}
