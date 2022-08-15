%{
#include"y.tab.h"
// extern char yylval;
%}
ALPHA [A-Za-z]+
DIGIT [0-9]+
%%
{ALPHA} {yylval.sym=(char)yytext[0];
          return NUMBER;}
{DIGIT} {yylval.sym=(char)yytext[0];
          return LETTER;}
\n return 0;
. return yytext[0];
%%
