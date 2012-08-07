#include <iostream>
#include <cmath>
#include <vector>
#include <algorithm>
#include <utility>

#define TOTAL 100000

using namespace std;

bool myfunction (pair<int,int> a, pair<int, int> b) { return (a.first<b.first); }

int main(){
	vector<pair<int,int> > num (TOTAL+1);
	num[2] = make_pair(2,2);
	num[3] = make_pair(3,3);
	int i, j, rem, curr;
	for (i = 4; i <= TOTAL; i++){
		rem = i;
		for (j = sqrt(i)+1; j >1; j--){
			if (rem % j == 0) {
				while (rem % j == 0){
					rem /= j;
				}
				rem *= j;
			}
		}
		num[i] = make_pair(rem, i);
	}
	sort(num.begin(), num.end());
	cout << num[10000].first << ";" << num[10000].second<<endl;
	return 0;
}

