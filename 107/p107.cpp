#include <iostream>
#include <set>

#define N 40
#define MWT 999999
using namespace std;
int matrix[N][N];
int weight(){
	int res = 0, i, j;
	for(i =0; i < N; i++){
		for (j = 0; j < N; j++){
			res+= matrix[i][j];
		}
	}
	return (res/2);
}

int main(){
	int i, j;
	char t = ',';
	for (i = 0; i < N; i++){
		for (j = 0; j < N; j++){
			cin >> matrix[i][j]>>t;
		}
	}
	int start_weight = weight();
	set<int> mst;
	mst.insert(0);
	set<int> remain;
	int end_weight = 0;
	for (i = 1; i < N; i++){ remain.insert(i); }
	while (remain.size() > 0){
		int min_index = 0, min_weight = MWT;
		set<int>::iterator mst_it, remain_it;
		for (mst_it = mst.begin(); mst_it != mst.end(); mst_it++){
			for (remain_it = remain.begin(); remain_it != remain.end(); remain_it++){
				i = *mst_it;
				j = *remain_it;
				if ((matrix[i][j] > 0) && (matrix[i][j] < min_weight)){
					min_weight = matrix[i][j];
					min_index = j;
				}
			}
		}
		remain.erase(min_index);
		mst.insert(min_index);
		end_weight += min_weight;
	}
	cout << (start_weight - end_weight)<<endl;
}
