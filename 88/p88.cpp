#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_NUM 12000
#define TOTAL (MAX_NUM*2)

void init_factors(vector<int> &factors, int max_f){
	int i;
	for (i = 0; i < max_f; i++) {factors[i] = 2;}
}

int proizv(vector<int> &factors, int max_f){
	int res = 1, i; 
	for (i = 0; i < max_f; i++){
		res*=factors[i];	
	}
	return res; 
}

int sum(vector<int> &factors, int max_f){
	int res = 0, i; 
	for (i = 0; i < max_f; i++){
		res+=factors[i];	
	}
	return res;
}

int next(vector<int> &factors, int max_f){

	if (proizv(factors,max_f) < TOTAL) {
		factors[max_f-1]+=1;
		return (max_f-1);
	}
	int curr = max_f-1, i;
	while ((proizv(factors, max_f) >= TOTAL) &&(curr>=0)){
		curr--;
		factors[curr]+=1;
		for (i = curr; i<max_f; i++){
			factors[i] = factors[curr];
		}
	}
	return curr;
}

int main(){
	int max_factors = (int)log(TOTAL+0.0)/log(2.0);
	cout << "Max factors is " << max_factors << endl;
	vector<int> factors (max_factors+1);
	vector<int> sum_prod (MAX_NUM+2, TOTAL+1);
	int i, j;
	for (i = 2; i < max_factors+1; i++){
		cout << "Going with total " << i << " factors "<<endl;
		init_factors(factors, i);
		int curr = i-1;
		while ((curr>=0)) {
			int p = proizv(factors, i);
			int s = sum(factors, i);
			int mnog = i + (p-s);
			if ((mnog < MAX_NUM) && (curr>=0)){
				if (sum_prod[mnog] > p) {sum_prod[mnog] = p;}
			}
			curr = next(factors, i);
		}
	}
	vector<int> my_set (TOTAL+1, 0);
	int my_sum = 0;
	for (i = 0; i < MAX_NUM; i++){
		cout << sum_prod[i] <<endl;
		if (my_set[sum_prod[i]] == 0) {
			my_sum += sum_prod[i];
			my_set[sum_prod[i]] = 1;
		}
	}
	cout << "Finished " << my_sum <<endl;
}
