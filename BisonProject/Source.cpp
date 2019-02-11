#include <iostream> 
#include <string>
#include"parser.h"

using namespace std;

int yylex()
{
	char c;
	cin.get(c);
	return (c == '\n') ? 0 : c;
}

void yyerror(const char *msg)
{
	cerr << msg << endl;
}

int main()
{
	if (yyparse() == 0) // вывод результатов синтаксического анализа  
	{
	cout << "Success" << endl;
	}
	system("pause");
}