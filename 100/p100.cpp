#include <iostream>
#include <cmath>

using namespace std;

int main(){
	double rt, sq;
	long long r = 0, b = 0, t = 0;
	long long x_1 = 7;
	long long x_2 = 1;
	long long x;
	while (t < 1000000000000){
		x = 6*x_1 - x_2;
		x_2 = x_1;
		x_1 = x;
		rt = x;
		rt = 8*(1+rt*rt);
		sq = floor(sqrt(rt));
		if (rt - sq*sq < 0.01) {
			r = (4+(long long)sq)/8;
			rt = r;
			rt = rt*rt;
			b = (1 - 2*r+sqrt(1-8*r+8*rt))/2;
			t = b+r;
			cout << "x " << x << "; r " << b << "; b " << r << "; total " << t << endl;
		}
	}
}
