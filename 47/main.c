#include <stdio.h>
#include <math.h>

int is_prime(int n)
{
	if (n <= 1) {return 0;}
	if (2 == n) {return 1;}
	if (0 == n%2) {return 0;}
	int isqr = (int)sqrt(n)+1;
	int i;
	for (i = 3; i < isqr; i+=2)
	{
		if (0 == n%i) {return 0;}
	}
	return 1;
}


int distinct_factors(int a, int b, int c, int d)
{
	int max = ((int)sqrt(d))+1;
	int ia = 0, ib = 0, ic = 0, id = 0, i;
//	printf("new %i\n", a);
	for (i = 2; i <= max; i++)
	{
		if (0 == is_prime(i)){continue;}
		//printf("p - %i ; %i %i %i %i;\n", i, a%i, b%i, c%i, d%i);
		if (0 == a % i) {ia++; while (0==a%i){a/=i;}}
		if (0 == b % i) {ib++; while (0==b%i){b/=i;}}
		if (0 == c % i) {ic++; while (0==c%i){c/=i;}}
		if (0 == d % i) {id++; while (0==d%i){d/=i;}}
		if (1 == is_prime(a)) {ia++; a = 1;}
		if (1 == is_prime(b)) {ib++; b = 1;}
		if (1 == is_prime(c)) {ic++; c = 1;}
		if (1 == is_prime(d)) {id++; d = 1;}
		if ((4<=ia) && (4<=ib) && (4<=ic) && (4<=id)) {return 1;}
	}
//	printf("%i %i; %i %i; %i %i; %i %i;\n", a, ia, b, ib, c, ic, d, id);
	return 0;
}
//242 11 11 2
//243
int main()
{
	int a = 4, b = 5, c = 6, d = 7;
	while (0 == distinct_factors(a, b, c, d))
	{
		a++;
		b++;
		c++;
		d++;
//		if (a%100 ==0) {printf("%i\n", a);}
	}
	printf("%i\n", a);
}
