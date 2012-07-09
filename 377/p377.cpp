#include <iostream>

#define MODULO 1000000000

using namespace std;

long my_fpos(long n)
{
	int a, b, c, d, e, f, g, h, i;
	long long res = 0;
	for (a = 0; a < n; a++)
	{
		for (b = 0; b < (n-a)/2; b++)
		{
			for (c = 0; c < (n-a-2*b)/3; c++)
			{
				for (d = 0; d < (n-a-2*b-c*3)/4; d++)
				{
					for (e = 0; e < (n-a-2*b-c*3-d*4)/5; e++)
					{
						for (f = 0; f < (n-a-2*b-c*3-d*4-e*5)/6; f++)
						{
							for (g = 0; g < (n-a-2*b-c*3-d*4-e*5-f*6)/7; g++)
							{
								for (h = 0; h < (n-a-2*b-c*3-d*4-e*5-f*6-g*7)/8; h++)
								{
									for (i = 0; i < (n-a-2*b-c*3-d*4-e*5-f*6-g*7-h*8)/9; i++)
									{
										res = (res+)%MODULO;
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

int main()
{
	cout << my_fpos(13) <<"\n";	
	cout << my_fpos(13*13) <<"\n";	
	cout << my_fpos(13*13*13) <<"\n";	
	return 0;
}
