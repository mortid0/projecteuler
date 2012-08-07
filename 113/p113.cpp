#include <iostream>
using namespace std;
#define LEN 100
long long table[LEN][10];

long long increasing(){
	int i, j, k;
	long long res = 0;
	for (i = 0; i < 10; i++) {
		for (j = 0; j < LEN; j++) {table[j][i] = 0;}
	}	
	for (i = 1; i < 10; i++) {table[0][i] = 1;}
	for (j = 1; j < LEN; j++) {
		for (i = 0; i < 10; i++) {
			for (k = i; k < 10; k++){	table[j][i] += table[j-1][k];		}
			res += table[j][i];
		}
	}
	return res;
}

long long decreasing(){
	int i, j, k;
	long long res = 0;
	for (i = 0; i < 10; i++) {
		for (j = 0; j < LEN; j++) {table[j][i] = 0;}
	}
	for (i = 1; i < 10; i++) {table[0][i] = 1;}
	for (j = 1; j < LEN; j++) {
		for (i = 0; i < 10; i++) {
			for (k = 0; k <= i; k++){	table[j][i] += table[j-1][k];	}
			res += table[j][i];
		}
	}
	return res;
}

int main(){
	cout << (increasing() + decreasing()-9*(LEN-2)) << endl;
	return 0;
}
