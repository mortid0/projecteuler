#include <stdio.h>

int is_isqr(long int n)
{
	char str[17];
	sprintf(str, "%li", n);
	if (('1'==str[0]) && ('2' == str[2]) && ('3' == str[4]) && ('4' == str[6]) && ('5' == str[8]) && ('6' == str[10]) && ('7' == str[12]) && ('8' == str[14]))
	{
		return 1;
	}
	return 0;
}

int main()
{
	long int l = 0L;
	int t = 0;
	int a, b, c, d, e, f, g;
	for (a = 3; a < 5; a++)
	{
		for (b = 0; b <= 9; b++)
		{
			for (c = 0; c <= 9; c++)
			{
				for (d = 0; d <= 9; d++)
				{
					for (e = 0; e <= 9; e++)
					{
						for (f = 0; f <= 9; f++)
						{
							t = a * 1000000 + b * 100000 + c*10000 + d * 1000 + e * 100 + f * 10 + 3;
							printf("%i;\n", t);
							l = ((long)t)*((long)t);
							printf("%i %i\n", l, t);
							if (1 == is_isqr(t*t)) {printf("%lld %d\n", l, t); return 0;}
							printf("%i;\n", t);
						}
					}
				}
			}
		}
	}
}
