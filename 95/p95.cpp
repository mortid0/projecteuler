#include <iostream>
#include <set>
#include <cmath>

using namespace std;

int sum_of_divisors(int num)
{
	int res = 1;
	int i;
	for (i = 2; i < sqrt(num); i++)
	{
		if (0 == num % i) {res += i + num/i;}
	}
	return res;
}

int main() {
	set<int> total;
	int min_el=1000000, max_len = 0, curr, tmp_len, i;
	for (i = 2; i <= 1000000; i++){
		if (total.find(i) != total.end()) {continue;}
		curr = i;
		tmp_len = 1;
		set<int> chain;
		while ((chain.find(curr) == chain.end()) && (curr <= 1000000)){
			chain.insert(curr);
			curr = sum_of_divisors(curr);
			tmp_len++;
		}
		if (curr == i) {
			total.insert(chain.begin(), chain.end());
			if (tmp_len > max_len) {max_len = tmp_len; min_el = i;}
		}
	}
	cout << "Len is: " << max_len << " min el is: " << min_el << endl;
}

