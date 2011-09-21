#include <stdio.h>
#include <math.h>

//3n2-n-2k = 0
//n = (1+-sqrt(1+8k))/6

int is_pentagonal(int n)
{
	double number = (1.0+sqrt(1+24*n))/6.0;
	double n_floor = floor(number);
	if (fabs(n_floor - number) < 0.00001) {return 1;}
	return 0;
}

int main()
{
	int i = 3;
	int j = 1;
	int sum = 13;
	int dif = 11;
	int n=12, k=1;
	while (!((is_pentagonal(sum) && is_pentagonal(dif))))
	{
		if (j < i) {j++; k = j*(3*j-1)/2;}
		else {i++; n = i*(3*i-1)/2;j = 1;k = j*(3*j-1)/2;}
		sum = n+k;
		dif = n-k;
//		printf("n %i Pn %i\tk %i Pk %i\tPent(sum %i) = %i Pent(dif %i) = %i\n", i, n, j, k, sum, is_pentagonal(sum), dif, is_pentagonal(dif));
	}
	printf("%i %i %i\n", n, k, n-k);
}
