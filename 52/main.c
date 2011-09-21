#include <stdio.h>
#include <string.h>
#include <math.h>

// check wether 2 strings contain same digits

inline int compare(char str1[], char str2[])
{
	int n = strlen(str1);
	if (n != strlen(str2)) {return 0;}
	int i, j;
	for (i = 0; i < n; i++)
	{
		j = 0;
		while (str1[i]!=str2[j])
		{
			j++;
			if (j==n) {return 0;}
		}
		str2[j] = '\0';
	}
	return 1;
}

inline int check_52(int num)
{
	int len = ((int)log10(num))+1;
	char s1[len];
	sprintf(s1, "%i", num);
	if (s1[0] != '1') {return 0;}
	char s2[len];
	int i, k;
	for (i = 2; i <=6; i++)
	{
		k = i * num;
		sprintf(s2, "%i", k);
		if (0==compare(s1, s2)) {return 0;}
	}
	return 1;
}

int main()
{
	int i = 10;
	while (0==check_52(i))
	{i++;
		if (i == 167) {i = 1000;}
		if (i == 1667) {i = 10000;}
		if (i == 16667) {i = 100000;}
		if (i == 166667) {i = 1000000;}
	}
	printf("%i\n", i);
	return 0;
}
