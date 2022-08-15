%{
    #include<stdio.h>
    #include<stdlib.h>
    int count=0;
%}
%token FOR EXP SPACE NUM
%%
S:I
;
I:FOR A B {count++;}
;
A:'('E';'E';'E')'
;
E:EXP Z NUM
|EXP Z EXP
|EXP U
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
Z:'='
|'>'
|'<'
|'<''='
|'>''='
|'+''='
|'-''='
;
U:'+''+'
|'-''-'
;
O:'+'
|'-'
|'*'
|'='
|'/'
|';'
;
%%
int main()
{
    printf("Enter the statement: \n");
    yyparse();
    printf("no. of nested FORs are : %d\n",count);
}
int yyerror()
{
    printf("ERROR!!!\n");
    exit(0);
}
