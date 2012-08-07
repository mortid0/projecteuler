#include <iostream>
#include <vector>

using namespace std;

#define TOTAL 100000000

int nums[TOTAL];

int main(){
	int i, j;
	vector<double> primes;
	for (i = 1; i < TOTAL; i++){
		nums[i] = 1;
	}
	for (i = 2; i < TOTAL; i++){
		if (1 == nums[i]) {
			for (j = i; j < TOTAL; j+=i){	nums[j] = 0; }
			primes.push_back(i);
		}
	}
//	cout << "primes!" << endl;
//	for (i = 0; i < primes.size(); i++){cout << primes[i]<<endl;}
	int res = 0;
	for (i = 0; i < primes.size(); i++){
		for (j = i; ((j < primes.size()) && (primes[j]*primes[i] < TOTAL)); j++) {res++;}
	}
	cout << res << endl;
	return 0;
}
