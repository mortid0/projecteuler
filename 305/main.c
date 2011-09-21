#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#define NUM 8

int str[NUM];
long long int last_index;
int *curr_found;

void make_array_from_num(int num, int size, int *array)
{
	int i = 0;
	while (num > 0)
	{
		array[size-(i+1)] = num % 10;
		num /= 10;
		i++;
	}
}

void shift_str(int last_num)
{
	int i;
	for (i = 0; i < (NUM-1); i++)
	{
		str[i] = str[i+1];
	}
	str[NUM-1] = last_num;
}

int find_in_str(int *n, int size)
{
	int i;
	for (i = 1; i <= size; i++)
	{
//		printf("size = %i; index = %i; %i %i\n", size, i, n[size-i], str[NUM-i]);
		if (n[size-i] != str[NUM-i]) {return 0;}
	}
	return 1;
}

void add_digits(int *numbers, int col, int **n, int *size, int digits)
{
	int len = ((int)log10(digits))+1;
	int num[len];
	make_array_from_num(digits, len, num);
	int i, j;
	for (i = 0; i < len; i++)
	{
//		printf("digits %i, len %i, fst %i\n", digits, len, num[i]);
		shift_str(num[i]);
		last_index++;
		for (j = 0; j < col; j++)
		{
			if (curr_found[j] < numbers[j]) {curr_found[j]+= find_in_str(n[j], size[j]);}
			if (curr_found[j] == numbers[j]) {printf("f(%i) = %lld\n", numbers[j], last_index-size[j]+1); curr_found[j]+=1;}
		}
	}
}

int f305(int *numbers, int col)
{
	last_index = 0;
	int i, j, size[col];
	for (i = 0; i < NUM; i++) {str[i] = 0;}
	int **n;
	n = malloc(col*sizeof(int *));
	curr_found = malloc(col*sizeof(int));
	for (j = 0; j < col; j++)
	{
		size[j] = ((int)log10(numbers[j])) + 1;
		n[j] = malloc(size[j]*sizeof(int));
		make_array_from_num(numbers[j], size[j], n[j]);
//		printf("numbers %i, size %i, fst %i\n", numbers[j], size[j], n[j][0]);
		curr_found[j] = 0;
	}
	i = 0;
	while (curr_found[col-1] < numbers[col-1])
	{
		i++;
		add_digits(numbers, col, n, size, i);
//		printf("checking %i, last_index %i, found %i, str %i%i%i%i%i%i%i%i\n", i, last_index, curr_found, str[12], str[13], str[14], str[15], str[16], str[17], str[18], str[19]);
	}
	for (j = 0; j < col; j++)
	{
		free(n[j]);
	}
	free(n);
	free(curr_found);
	return 0;
}

int main()
{
//	f305(5);
//	f305(7780);
	int n = 1;
	int i;
	int *a;
	a = malloc(13*sizeof(int));
	for (i = 0; i <=13; i++)
	{
		n*=3;
		a[i] = n;
	}
	printf("start f\n");
	f305(a, 13);
	return 0;
}
