#include <iostream>
using namespace std;
#define LEN 1000
long long f[LEN];

int main(){
	int i;
	for (i = 0; i <52;i++){
		f[i] = 1;
	}
	i = 50;
	f[i] = 2;
	while ((f[i] < 1000000) && (i < LEN)){
		i++;
		f[i] = 2*f[i-1]-f[i-2]+f[i-51];
	}
	cout <<f[i]<<" | " << i<<endl;
}
