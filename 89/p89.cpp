#include <iostream>
#include <string>

using namespace std;

int get_number(char c)
{
	if ('I' == c) {return 1;}
	if ('V' == c) {return 5;}
	if ('X' == c) {return 10;}
	if ('L' == c) {return 50;}
	if ('C' == c) {return 100;}
	if ('D' == c) {return 500;}
	if ('M' == c) {return 1000;}
}

int main()
{
	string curr_num;
	cin >> curr_num;
	int i, normal, digit, total;
	total = 0;
	int res = 0;
	while (total < 1000) {
		normal = 0;
		for (i = 0; i < curr_num.size()-1; i++)
		{
			digit = get_number(curr_num[i]);
			if (digit < (get_number(curr_num[i+1]))) {normal -= digit;}
			else {normal += digit;}
		}
		normal += get_number(curr_num[curr_num.size()-1]);
		cout << curr_num <<" -> "<< normal;
		int rem = normal;
	
		while (rem > 0)
		{
			if (rem >= 1000) { res+=1; rem -= 1000; cout << "M"; continue;}
			if (rem >= 900) { res+=2; rem -= 900; cout << "CM";continue;}
			if (rem >= 500) { res+=1; rem -= 500; cout << "D";continue;}
			if (rem >= 400) { res+=2; rem -= 400; cout << "CD";continue;}
			if (rem >= 100) { res+=1; rem -= 100; cout << "M";continue;}
			if (rem >= 90) { res+=2; rem -= 90; cout << "XC";continue;}
			if (rem >= 50) { res+=1; rem -= 50; cout << "L";continue;}
			if (rem >= 40) { res+=2; rem -= 40; cout << "XL";continue;}
			if (rem >= 10) { res+=1; rem -= 10; cout << "X";continue;}
			if (rem >= 9) { res+=2; rem -= 9; cout << "IX";continue;}
			if (rem >= 5) { res+=1; rem -= 5; cout << "V";continue;}
			if (rem >= 4) { res+=2; rem -= 4; cout << "IV";continue;}
			if (rem >= 1) { res+=1; rem -= 1; cout << "I";continue;}
		}
		res -= curr_num.size();
		cout << endl;
		cin >> curr_num;
		total++;
	}
	cout << "Result " << res << endl;
}
