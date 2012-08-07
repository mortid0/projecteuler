#include <iostream>
#define TOTAL 10000000
//Plain Eratosphene sieve
using namespace std;
int num[TOTAL+1];
	
int main(){

	int res = 0;
	int i, j;
	for (i = 0; i <= TOTAL; i++){
		num[i] = 1;
	}
	for (i = 2; i <= TOTAL; i++){
		for (j = i; j <= TOTAL; j+=i){
			num[j] += 1;
		}
		if (num[i] == num[i-1]) {res++;}
	}
	cout << res <<endl;
}
