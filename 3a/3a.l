%{
#include <stdio.h>
int i=0,l=0;
%}
%%
"//"[^\n]*[\n] {l++;}
"/*"(.|\n)*"*/" {l++;
				for(i=0;i<yyleng;i++)
					if(yytext[i]=='\n')
						l++;} 
. {fprintf(yyout,"%s",yytext);}
%%
int main(){
	yyin=fopen("in.c","r");
	yyout=fopen("out.c","w");
	yylex();
	printf("Number of comments: %d \n",l);
	return 0;
}

int yywrap(){ return 1; }