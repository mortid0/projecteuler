#include <iostream>
#include <vector>

using namespace std;

void next_prime(vector<long long> &primes, int pos){
	bool found = false;
	long long last = primes[pos-1]+2;
	int curr = 0;
	while (primes[curr]*primes[curr] <= last){
		if (last % primes[curr] == 0) {
			last += 2;
			curr = 0;
		} else {
			curr++;
		}
	}
	primes[pos] = last;
}

int main(){
	vector<long long> primes (20000, 2);
	primes[0] = 2;
	primes[1] = 3;
	primes[2] = 5;
	int i = 3, j;
	bool found;
	long long res = 2*(i+1)*primes[i];
	while (res < 10000000000){
		next_prime(primes, i);
		i+=1;
		next_prime(primes, i);
		i+=1;
		res = 2*(i)*primes[i-1];
	}
	cout << i << endl;
	return 0;
}
