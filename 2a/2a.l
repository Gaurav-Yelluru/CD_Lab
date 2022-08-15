%{
	#include<stdio.h>
	#include<stdlib.h>
	int p=0;
	int n=0;
	int pfrac = 0;
	int nfrac = 0;
%}
%%
[+]?[0-9]+ {p++;}
[-][0-9]+ {n++;}
[-][0-9]*[.][0-9]+ {nfrac++;}
[+]?[0-9]*[.][0-9]+ {pfrac++;}
[+]?[0-9]*[.]?[0-9]+[/][+]?[0-9]*[.]?[0-9]+ {pfrac++;}
[-][0-9]*[.]?[0-9]+[/][-][0-9]*[.]?[0-9]+ {pfrac++;}
[+]?[0-9]*[.]?[0-9]+[/][-][0-9]*[.]?[0-9]+ {nfrac++;}
[-][0-9]*[.]?[0-9]+[/][+]?[0-9]*[.]?[0-9]+ {nfrac++;}
\n return 0;
%%
int main()
{
	printf("Enter numbers: ");
	yylex();
	printf("\nPositive integers %d and negative integers %d",p,n);
	printf("\nPositive fractions %d and negative fracions %d\n",pfrac,nfrac);
	return 0;
}

int yywrap(){ return 1; }
