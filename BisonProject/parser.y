%defines "parser.h"

%{
#include <iostream>
using namespace std;

int yylex();
void yyerror(const char *msg);
%}

%union { double d;};

%type <d> S E T H L B

%%

S: E { cout << "Output string: " << $1 << endl;}

E: T '+' T { $$ = $1 + $3; }

T: H '.' L { $$ = $1 + $3 / 10; }

H   : B   { $$ = $1; }
    | H B { $$ = $1 * 10 + $2; }

L   : B   { $$ = $1; }
    | B L { $$ = $2 / 10 + $1; }

B   : '0' { $$ = 0; }
    | '1' { $$ = 1; }
    | '2' { $$ = 2; }
    | '3' { $$ = 3; }
    | '4' { $$ = 4; }
    | '5' { $$ = 5; }
    | '6' { $$ = 6; }
    | '7' { $$ = 7; }
    | '8' { $$ = 8; }
    | '9' { $$ = 9; }
%%