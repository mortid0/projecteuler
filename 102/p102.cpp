#include <iostream>
#include <cmath>

using namespace std;

double area_zero(int xb, int yb, int xc, int yc) {return 0.5*fabs(xb*yc-xc*yb);}

double area_gen(int xa, int ya,int xb, int yb, int xc, int yc) {return 0.5*fabs(xa*yb - xa*yc + xb*yc - xc*yb - xb*ya + xc*ya);}

int main()
{
	int i, total = 0;
	for (i = 0; i < 1000; i++){
		int xa, ya, xb, yb, xc, yc;
		char c;
		cin >> xa >> c >> ya >> c >> xb >> c >> yb >> c >> xc >> c >> yc;
		double total_area = area_gen(xa, ya, xb, yb, xc, yc);
		double area_oab = area_zero(xa, ya, xb, yb);
		double area_oac = area_zero(xa, ya, xc, yc);
		double area_obc = area_zero(xc, yc, xb, yb);
		if (fabs(total_area - area_oab - area_oac - area_obc) < 0.01) {total++;}
	}
	cout << total << endl;
}
