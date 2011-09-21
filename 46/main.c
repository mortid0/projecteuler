#include <stdio.h>
#include <math.h>

int is_prime(int n)
{
	if (0 == n%2) {return 0;}
	if (n < 1) {return 0;}
	int isqr = (int)sqrt(n) + 1;
	int i;
	for (i = 3; i < isqr; i+=2)
	{
		if (0 == n%i) {return 0;}
	}
	return 1;
}

int check_goldbach(int n)
{
	int i, s;
	int isqr = (int)sqrt(0.5*n);
	for (i = 1; i <=isqr; i++)
	{
		s = n - 2*i*i;
		if (is_prime(s))
		{
			printf("%i = %i + 2*%i*%i;\n", n, s, i, i);
			return 0;
		}
	}
	return 1;
}


int main()
{
	int i, num;
	num = 0;
	printf("13 %i; 15 %i; 25 %i\n", is_prime(13), is_prime(15), is_prime(25));
	i = 9;
	while (0 == num)
	{
		if (0 == is_prime(i))
		{
			printf("checking %i\n", i);
			if (check_goldbach(i))
			{
				num = i;
			}
		}
		i += 2;
	}
	printf("num = %i\n", num);
	return 0;
}
