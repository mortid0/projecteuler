#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <cstdio>
#include <map>
#include <cmath>

using namespace std;

bool match(long long num, string str) {
	char tmp[40];
	sprintf(tmp, "%lld", num);
	string pwd(tmp);
	map<char,char> dict;
	int i;
	for (i = 0; i < str.size(); i++)
	{
		if (dict.count(pwd[i]) >0) {
			if (dict[pwd[i]] != str[i]) {return false;}
		}
		else {dict[pwd[i]] = str[i];}
	}
	return true;
}

bool anagrams(string a, string b)
{
	if (a.size() != b.size()) {return false;}
	if (a.compare(b)==0) {return false;}
	map<char,int> dict;
	int i, total = a.size();
	for (i = 0; i < a.size(); i++)
	{
		if (dict.count(a[i]) >0) {dict[a[i]] += 1;}
		else {dict[a[i]] = 1;}
	}
	for (i = 0; i < a.size(); i++)
	{
		if (dict.count(b[i]) == 0) {return false;}
		else {
			dict[b[i]] -= 1; 
			if (dict[b[i]] < 0) {return false;}
		}
	}
	return true;
}
void check_other(string str, vector<string> angs, long long num){
	char tmp[40];
	sprintf(tmp, "%lld", num);
	string pwd(tmp);
	map<char,char> dict;
	int i,j;
	for (i = 0; i < str.size(); i++)
	{
		dict[str[i]] = pwd[i];
	}
	for (j = 0; j < angs.size(); j++)
	{
		long long res = 0;
		for (i = 0; i<angs[j].size(); i++){
			res = res*10+(dict[angs[j][i]]-'0');
		}
		double tmp = floor(sqrt(res));
		if (res - tmp*tmp < 0.5) {cout << res << " and " << num << " represent " << angs[j] << " and " << str << endl;}
	}
}

int main()
{
	vector<string> words;
	string word;
	ifstream in("words.txt");
	int i = 0, j;
	int max_length = 0, max_item = 0;
	while (in){
		getline(in, word, ',');
		words.push_back(word.substr(1,word.length()-2));
		if (word.length()-2 > max_length) {max_length = word.length()-2; max_item = i;}
		i++;
	}
	vector<vector<string> > dict(max_length+1), dict2(max_length+1);
	map<string,vector<string> > angrms;
	i--;
	while (i > 0){
		j = words[i].length();
		dict[j].push_back(words[i]);
		i--;
	}
	int k;//make anagrams conncection
	for  (j = max_length; j > 0; j--)	{
		for (i = 0; i < dict[j].size()-1; i++) {
			int found = 0;
			for (k = i+1; (k < dict[j].size()) && (0 == found);k++){
				if (anagrams(dict[j][i], dict[j][k])) {
					dict2[j].push_back(dict[j][i]);
					angrms[dict[j][i]].push_back(dict[j][k]);
					found = 1;
				}
			}
		}
	}
	
	for (j = max_length; j>0; j--){
		if (dict2[j].size() == 0) {continue;}
		int curr_num;
		int start = (int)(sqrt(pow(10,j)))-1;
		int finish = (int)(sqrt(pow(10,j-1)))-1;
		for (curr_num = start; curr_num > finish; curr_num-- ){
			long long sqr_num = curr_num;
			sqr_num *= sqr_num;
			int total_matches = 0;
			for (i = 0; i < dict2[j].size(); i++){
				total_matches += match(sqr_num, dict2[j][i]);
				if (1==match(sqr_num, dict2[j][i])) {
					check_other(dict2[j][i], angrms[dict2[j][i]],sqr_num);
				}
			}
		}
	}
}
