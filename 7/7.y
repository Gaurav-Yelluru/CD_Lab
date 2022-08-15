%{
#include <stdio.h>
#include <stdlib.h>
%}
%token TYPE ID SPACE NUM
%%
S:X'{'D'}'
|X ';'
;
X:TYPE SPACE ID'('A')'
;
A:TYPE SPACE ID','A
|TYPE SPACE ID
|
;
D:E';'D
|
;
E:E'+'E
|E'-'E
|E'*'E
|E'/'E
|ID'='NUM
|ID
|NUM
;
%%
int main(){
	printf("Enter the expression:");
	yyparse();
	printf("Valid\n");
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}
