#include <iostream>
using namespace std;
#define LEN 52
int main(){
	long long f[LEN];
	f[1] = 1;
	f[2] = 1;
	f[3] = 1;
	f[4] = 2;
	int i;
	for (i = 5; i < LEN; i++){
		f[i] = 2*f[i-1]-f[i-2]+f[i-4];
	}
	cout <<f[51]<<endl;
}
