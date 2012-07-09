#include <iostream>
#include <fstream>
#include <stack>

using namespace std;

class Sudoku{
	public:
		int table[81];
		int pos;
		Sudoku(int sud[81], int curr_pos);
};

Sudoku::Sudoku(int sud[81], int curr_pos)
{
	int i, j;
	for (i = 0; i < 9; i++)
	{
		for (j = 0; j < 9; j++)
		{
			table[9*i+j] = sud[9*i+j];
		}
	}
	pos = curr_pos;
}

bool check_cell(int sud[81], int i, int j, int k)
{
	int m;
	for (m = 0; m < 9; m++)
	{
		if (sud[i*9 + m] == k) {return false;}
		if (sud[m*9 + j] == k) {return false;}
	}
	int cX = 3*(j/3);
	int cY = 3*(i/3);
	for (int x = 0; x < 3; x++)
	{
		for (int y = 0; y < 3; y++)
		{
			if (sud[(cX+x)+9*(cY+y)] == k) {return false;}
		}
	}
	return true;
}

// work with current solution from stack
// if pos == 81 we finished
// if stack is empty - there is no solution
void stack_solution(stack<Sudoku> *sol)
{
	int pos = (*sol).top().pos;
	if (pos == 81) {cout<<"\n" <<(*sol).top().table[0]<<(*sol).top().table[1]<<(*sol).top().table[2]<<"!!";return;}
	int x = pos % 9;
	int y = pos / 9;
//	cout <<"before" << pos<<";" << "(" << x << "," << y << ")" << (*sol).top().table[pos]<<".";
	if ((*sol).top().table[pos] > 0) {(*sol).top().pos += 1;  cout << (*sol).top().table[pos]<<"\n"; return;}
//	cout << "after"<< pos<<";" << "(" << x << "," << y << ")";
	int k;
	bool success = false;
	for (k = 1; k <= 9; k++)
	{
		if (check_cell((*sol).top().table,x,y,k)) 
		{
			(*sol).push(Sudoku((*sol).top().table, pos+1));
			cout << "after"<< pos<<";" << "(" << x << "," << y << "->" << k<<")" << (*sol).top().table[pos+1]<<"\n";
			success = true;
		}
	}
	if (!success) {(*sol).pop();}
}

int solve_problem(int sud[81])
{
	Sudoku s = Sudoku(sud, 0);
	stack<Sudoku> st;
	st.push(s);
	while (st.top().pos < 81)
	{
		stack_solution(&st);
	}
	int res = 0;
	if (!st.empty())
	{
		cout <<st.top().table[0]<<st.top().table[1]<<st.top().table[2];
		res = (st.top().table[0]+st.top().table[1]+st.top().table[2]);
	}
	while (!st.empty()){st.pop();}
	return res;
}

int main()
{
	char filename[] = "sudoku.txt";
	ifstream myfile (filename);
	char grid_line[16];
	if (!myfile.is_open()) {return -1;}
	int i = 0;
	int j = 0;
	int k = 0;
	int sud[81];
	int res = 0;
	myfile.getline(grid_line, 9,'\n');
	while ((myfile.good())&& (k<1))
	{
		sud[i*9+j] = myfile.get() - '0';
		cout << sud[i*9+j];
		j++;
		if (9==j) {i++;j=0;cout<<"\n";myfile.get();}
		if (9==i) {res += solve_problem(sud); i = 0; j = 0;	myfile.getline(grid_line,9);cout << "\n"; k++;}
	}
	myfile.close();
	cout << "Res = "<< res << "\n";
}
