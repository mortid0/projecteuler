#include <iostream>
#include <map>
#include <vector>
#include <algorithm>

using namespace std;

bool check_size(vector<int> &ar){
	int i, j, sum1, sum2, len1, len2;
	sort (ar.begin(), ar.end());
	for (i = 2; i <= (ar.size()-2); i++){
		sum1 = 0;	len1 = 0;
		for (j = 0; j < i; j++){sum1 += ar[j]; len1++;}
		sum2 = 0; len2 = 0;
		for (j = ar.size()-i+1; j < ar.size(); j++) {sum2 += ar[j];len2++;}

		if ((sum1 <= sum2) && (len1 > len2)) {
//			cout << "!!!Sizes bad"<<endl;
			return false;
		}
	}
	return true;
}

bool next_sum(vector<int> &ind, int n){
	int i;
	if (ind[1] == 0) {
		for (i=0; i < ind.size(); i++) {ind[i] = i;}
		return true;
	}
	i = ind.size() - 1;
	while (i >= 0){
		int max_index = n - ind.size() + i;
		if (ind[i] < max_index) {
			int j;
			ind[i] = ind[i]+1;
			for (j = i+1; j < ind.size(); j++){
				ind[j] = ind[j-1]+1;
			}
			return true;
		}
		i--;
	}
	return false;
}

bool check_sum(vector<int> &ar){
	int n;
	map<int, int> visited;
	visited.clear();
	for (n = 2; n <= ar.size(); n++){
		vector<int> ind (n, 0);
		int i, sum;
		while (next_sum(ind, ar.size())){
			sum = 0;
			for (i = 0; i < n; i++){
				sum += ar[ind[i]];
//				cout << ind[i] << "; " << ar[ind[i]]<< " | ";
			}
//			cout << endl;
			if (visited.count(sum) >0) {
				cout << "Sum is " << sum << endl;
				return false;
			}
			else {visited[sum] = 1;}
		}
	}
	return true;
}

int main(){
	
	cout << "Total sum is " << sum << endl;
}
