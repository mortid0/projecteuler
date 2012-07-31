#include <vector>
#include <iostream>

#define SIZE 1000000

using namespace std;

int sum_fib(vector<int> &a, vector<int> &b, int l){
	int i = SIZE-1;
	int curr_a, curr_b, rem = 0, curr_c = 0;
	while (i >= l) {
		curr_b = b[i];
		curr_a = a[i];
		curr_c = (curr_a+curr_b+rem)%10;
		a[i] = curr_c;
		rem = (curr_a+curr_b+rem - curr_c)/10;
		i--;
	}
	if (rem > 0) { a[i] = rem; i--;}
	return (i+1);
}

bool check_pandig(vector<int> &a, int n){
	vector<int> fst (10, 0);
	vector<int> snd (10, 0);
	int i;
	for (i = 1; i < 10; i++){
		fst[a[n+i-1]] = 1;;
		snd[a[SIZE-i]] = 1;
	}
	bool res = true;
	for (i = 1; i < 10; i++) {
		res &= ((fst[i]>0) && (snd[i]>0));
	}
	if (res) {
		for (i = 1; i < 10; i++)
		{
			cout << a[n+i]<<" -- " << a[SIZE-i] << " || " << fst[i] << " * "<< snd[i]<< endl;
		}
	}
	return res;
}

int main(){
	vector<int> fa (SIZE, 0);
	vector<int> fb (SIZE, 0);
	fa[SIZE-1] = 1;
	fb[SIZE-1] = 1;	
	int i = 0, l = SIZE-1, k; 
	while (i < 330000) {
			l = sum_fib(fa, fb, l);
			k = (l>(SIZE-10))?(SIZE-10):l;
			if (check_pandig(fa, k)) {cout << (i+3) << endl; break;}
			i++;
			l = sum_fib(fb, fa, l);
			k = (l>(SIZE-10))?(SIZE-10):l;
			if (check_pandig(fb, k)) {cout << (i+3) << endl; break;}
			i++;
	}
	cout << (i+3) << endl;
}

