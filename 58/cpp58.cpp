#include <iostream>
#include <math.h>
 
using namespace std;
 
bool is_prime(int n)
{
	int size = sqrt(n);
	for(int i=2; i <= size; ++i)
		if(n%i == 0)
			return false;
	return true;
}
 
int main()
{	
	int skip=0, current=1, numbers=1, primes=0;
	float ratio=1;
 
	while (ratio > 0.1)
	{
		skip    +=2;
		numbers +=4;
 
		current += skip;
		if(is_prime(current))
			++primes;
 
		current += skip;
		if(is_prime(current))
			++primes;
 
		current += skip;
		if(is_prime(current))
			++primes;
 
		current += skip;
		if(is_prime(current))
			++primes;		
 
		ratio = float(primes) / numbers;
	}
	cout << skip+1 << endl;
}
