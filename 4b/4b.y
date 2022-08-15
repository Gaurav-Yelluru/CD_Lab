%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
%}
%token IF EXP NUM SPACE
%%
S:I
;
I:IF A B {count++;}
;
A:'('E')'
;
E:EXP Z NUM
|EXP Z EXP
|SPACE
;
B:'{'B'}'
|I
|D
|
;
D:EXP O D
|
;
O:'+'
|'-'
|'*'
|'='
|'/'
|';'
;
Z:'>'
|'<'
|'<''='
|'>''='
;
%%
int main()
{
    printf("Enter the statement: \n");
    yyparse();
    printf("no. of nested IFs are: %d\n",count);
    return 0;
}
int yyerror()
{
    printf("ERROR!!!\n");
    exit(0);
}
