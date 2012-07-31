#include <iostream>
#include <cmath>

using namespace std;

int is_bouncy(int num){
	int up = -1, down = -1;
	int l = log10(num) + 1;
	int len = l;
	int a = num % 10;
	l--;
	while (l>0){
		num = num / 10;
		int b = num % 10;
		if (b>a) {down = l;}
		if (b<a) {up = l;}
		a = b;
		l--;
	}
	if ((up>-1) && (down>-1)) { return 1;}
	return -1;
}

int main()
{
	int curr = 100;
	int bouncy = 0;
	while (bouncy < 0.98999874*(curr+1)){
		int res = is_bouncy(curr);
		if (res >-1) {
			bouncy += res;
			curr += res;
		}
		else {curr++;}
	}
	cout << "Bouncy numbers " << bouncy << " prop " << (bouncy/(curr+1.0))<<endl;
	cout << curr << endl;
}
