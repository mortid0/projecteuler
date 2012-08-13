#include <iostream>

using namespace std;

int main(){
	int primes[25] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97};
	int i, j, n, s = 2;
	for (i = 2; i < 1000000000; i++){
		n = i;
		j = 0;
		while ((n > 1) && (j < 25)) {
			while (n%primes[j]==0) {n /= primes[j];}
			j++;
		}
		if (n==1) {s++;}
	}
	cout << s << endl;
}
