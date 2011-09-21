#include <stdlib.h>
#include <stdio.h>
 
int main()
{
	int fac = 9*8*7*6*5*4*3*2*10;
	printf("\ntotal permutations = %i\n", fac);
	int a10, a1, a2, a3, a4, a5, a6, a7, a8, a9;
	char s[10];
	long long sum = 0;
	long long a;
	for (a1 = 0; a1 < 10; a1++)
	{
		if (a1==5) {continue;}
		for (a2 = 0; a2 <10; a2++)
		{
			if (a2==5) {continue;}
			if (a1==a2) {continue;}
			for (a3 = 0; a3 < 10; a3++)
			{
				if (a3==5) {continue;}
				if ((a3==a2)||(a3==a1)) {continue;}
				for (a4 = 0; a4 < 10; a4+=2)
				{
					if ((a4==a2)||(a4==a1)||(a4==a3)) {continue;}
					for (a5 = 0; a5 < 10; a5++)
					{
						if (a5==5) {continue;}
						if ((a5==a4)||(a5==a2)||(a5==a1)||(a5==a3)) {continue;}
						if ((a3+a4+a5)%3>0){continue;}
						a6 = 5;
						for (a7 = 0; a7 < 10; a7++)
						{
							if (a7==5) {continue;}
							if ((a7==a5)||(a7==a4)||(a7==a2)||(a7==a1)||(a7==a3)) {continue;}
							if ((100*a5+50+a7) % 7> 0) {continue;}
							for (a8 = 0; a8 < 10; a8++)
							{
								if (a8==5) {continue;}
								if ((a8==a7)||(a8==a5)||(a8==a4)||(a8==a2)||(a8==a1)||(a8==a3)) {continue;}
								if ((500+a7*10+a8) % 11> 0) {continue;}							
								for (a9 = 0; a9 < 10; a9++)
								{
									if (a9==5) {continue;}
									if ((a9==a8)||(a9==a7)||(a9==a5)||(a9==a4)||(a9==a2)||(a9==a1)||(a9==a3)) {continue;}
									if ((100*a7+a8*10+a9) % 13> 0) {continue;}
									for (a10 = 0; a10 < 10; a10++)
									{
										if (a10==5) {continue;}
										if ((a10 == a9)||(a10==a8)||(a10==a7)||(a10==a5)||(a10==a4)||(a10==a2)||(a10==a1)||(a10==a3)) {continue;}
										if ((100*a8+a9*10+a10) % 17> 0) {continue;}
										sprintf(s, "%i%i%i%i%i%i%i%i%i%i", a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
										a = atoll(s);
										printf("%s\n", s);
										sum += a;
									}
								}

							}

						}
					}
				}
			}
		}
	}
	printf("%lli\n", sum);
}
