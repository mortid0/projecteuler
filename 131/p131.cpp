#include <iostream>
#include <cmath>

using namespace std;

bool prime(int p){
	if (p%2==0) {return false;}
	int i;
	for (i = 3; i < sqrt(p)+1; i++){
		if (p%i==0) {return false;}
	}
	return true;
}

int main(){
	int s = 0, i = 3;
	while (i < 1000000) {
		if (prime(i)){
			int x = sqrt(12*i-3);
			if (x*x-12*i+3==0) {
				s++;
				cout << i << endl;
			}
		}
		i+=2;
	}
	cout << "Total" <<s<<endl;;
}
