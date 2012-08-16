#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std; 

bool is_prime(long long n){
	if (n%2==0) {return false;}
	int i;
	for (i=3; i < sqrt(n); i+=2){
		if (n % i == 0){return false;}
	}
	return true;
}

bool next_comb(vector<int> &comb){
	int k = comb.size()-2;
	while ((comb[k]>=comb[k+1]) && (k > -1)) {k--;}
	if (k==-1) {return false;}
	int l = comb.size()-1;
	while (comb[l]<=comb[k]) {l--;}
	long long t = comb[l], i, j;
	comb[l] = comb[k];
	comb[k] = t;
	for (l = 0; l < (comb.size()-(k+1))/2;l++){
		i = l+k+1;
		j = comb.size()-1-l;
		t = comb[i];
		comb[i] = comb[j];
		comb[j] = t;
	}
	return true;
}

long long get_num(vector<int> comb){
	int i;
	long long res = 0;
	for (i = 0; i < comb.size(); i++){
		res = res*10LL+comb[i];
	}
	return res;
}

bool next_end(vector<int> &comb, int start){
	int i;
	i = start;
	while ((comb[i] != 9) && (i < comb.size())) {i++;}
	i--;
	if (i < start) {return false;}
	comb[i]++;
	if (comb[i]==10) {return false;}
	while (i+1 < comb.size()) {comb[i+1] = comb[i]; i++;}
	return true;
}

int main(){
	int d = 1, e;
	long long len = 10, sum = 0, tmp_sum[10];
	long long i, j;
	for (i = 0; i < 10; i++) {tmp_sum[i] = 0;}
	vector<int> comb (len, 0);
	for (d = 0; d < 10; d++){
		int curr_len = len;
		while (tmp_sum[d] == 0){
			curr_len--;
			for (i = 0; i < curr_len; i++){ comb[i] = d;}
			for (i = curr_len; i < len; i++) {comb[i] = 0;}
			while (next_end(comb, curr_len)){
				vector<int> comb_cp (comb);
				sort(comb_cp.begin(), comb_cp.end());		
				long long r = get_num(comb_cp);
				if ((is_prime(r)) && (comb_cp[0]>0)) {tmp_sum[d] += r;}
				while (next_comb(comb_cp)){
					if (comb_cp[0] == 0) {continue;}
					r = get_num(comb_cp);
					if (is_prime(r)) {tmp_sum[d]+=r;}
				}
			}
			sum += tmp_sum[d];
			cout << "For digit " << d << " len is " << curr_len <<" sum is " << tmp_sum[d] << " Total = " << sum << endl;
		}	
	}
	cout << "Sum is " << sum << endl;
}
