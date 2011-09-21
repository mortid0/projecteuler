#include <stdio.h>

int main()
{
	long long i = 2;
	long long k;
	for (k = 2; k < 46; k++)
	{
		i *= k;
	}
	printf("%lld\n",i);
	i = 12345;
	printf("%lld\n",i);
}
