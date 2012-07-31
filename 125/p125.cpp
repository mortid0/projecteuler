#include <iostream>
#include <cmath>

using namespace std;

bool is_palindrome(int n){
	int l = 0, i = n;
	while (i>0){
		l = l*10 + i%10;
		i = i/10;
	}
	return (l==n);
}

bool is_sum_sq(int x){
	int d = 2;
	double discr = 3.0*((d+0.0)*d-(d+0.0)*d*d*d+12.0*d*x);
	while (discr>=0)
	{
		double sq = floor(sqrt(discr));
		if (fabs(sq*sq-discr)<0.1) {
			double n = (-3.0*d*d-3.0*d+sq)/(6.0*d);
			if ((fabs(n-floor(n)) <  0.001) && (n>=0)) {return true;}
		}
		d++;
		discr = 3.0*((d+0.0)*d-(d+0.0)*d*d*d+12.0*d*x);
	}
	return false;
}

int main()
{
	long long sum = 0, i;
	for (i = 2; i < 100000000; i++){
		if ((is_palindrome(i)) && (is_sum_sq(i))) {sum += i;}
	}
	cout << sum<<endl;
}
