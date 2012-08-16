#include <iostream>
#include <vector>
#include <set>
using namespace std;
int main(){
	vector<vector<set<int> > > m_table (201);
	int i = 4, j, s = 3;
	set<int> one;	one.insert(1);
	set<int> two;	two.insert(2); two.insert(1);
	set<int> three;	three.insert(3); three.insert(2); three.insert(1);
	vector<set<int> > m_one(1, one);
	vector<set<int> > m_two(1, two);
	vector<set<int> > m_three(1, three);
	m_table[1] = m_one;	m_table[2] = m_two;	m_table[3] = m_three;
	while (i < 201){
		int min_op = m_table[i-1][0].size()+1;
		for (j = 1; j <= i/2; j++){
			int k = i - j;
			int a, b;
			for (a = 0; a < m_table[k].size(); a++){
				for (b = 0; b < m_table[j].size(); b++){
					set<int> tmp (m_table[k][a]);
					tmp.insert (m_table[j][b].begin(), m_table[j][b].end());
					tmp.insert(i);
					if (tmp.size() < min_op) {
						min_op = tmp.size();
						vector<set<int> > ar(1, tmp);
						m_table[i] = ar;
					}
					if (tmp.size() == min_op) {
						int t;
						bool found_dup = false;
						for (t = 0; t < m_table[i].size(); t++){
							set<int>::iterator it;
							bool all_eqls = true;
							for (it = m_table[i][t].begin(); it != m_table[i][t].end(); it++){
								all_eqls &= (tmp.count(*it) > 0);
							}
							if (all_eqls) { found_dup = true; break;}
						}
						if (!found_dup) {
							m_table[i].push_back(tmp);
						}
					}
				}
			}
		}
		s += min_op-1;
//		set<int>::iterator it;
		cout << i << " ";/*
		for (j = 0; j < m_table[i].size(); j++){
			for (it = m_table[i][j].begin(); it != m_table[i][j].end(); it++){
				cout << *it << "; ";
			}
			cout << endl;
		}*/
		cout << " min_op is " << min_op << " variations "<< m_table[i].size()<<endl;
		i++;
	}
	cout<<s<<endl;
}
