%{
#include <stdio.h>
int wo=0,l=1,wh=0,c=0;
%}
%%
[a-zA-Z0-9]* {wo++;
			c=c+yyleng;}
[ ] {wh++;
	c++;}
[\t] {wh=wh+4;
	c=c+4;}
. c++;
[\n] l++;
%%
int main(){
	yyin=fopen("in.txt","r");
	yylex();
	printf("Words: %d and Lines: %d and WhiteSpaces: %d and Characters: %d\n",wo,l,wh,c);
	return 0;
}

int yywrap(){ return 1; }
