#include <stdio.h>
#include <math.h>

void reverse(int n, char str[n], char rev[n])
{
	int i;
	for (i = 0; i < n; i++)
	{
		rev[i] = str[n-i-1];
	}
	rev[n] = '\0';
}

int is_odd(int n)
{
	if (0 == n%10) {return 0;}
	int len = (int)(log10(n))+1;
	char s[len+1], r[len+1];
	sprintf(s, "%i", n);
	reverse(len, s, r);
	int sum = n + atoi(r);
	len = (int)(log10(sum))+1;
	char str[len+1];
	sprintf(str,"%i", sum);
	int i;
	for (i = 0; i < len;i++)
	{
		if (0 == ((str[i]-'0')%2)) {return 0;}
	}
	return 1;
}

int main()
{
	int i;
	int s = 0;
	for (i = 1; i < 1000000001; i++)
	{
		s += is_odd(i);
		if (0 == i % 1000001) {printf("%i\n", i);}
	}	
	printf("%i\n", s);
	return 0;
}
