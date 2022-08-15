%{
    #include "y.tab.h"
%}
%%
"for" return FOR;
[a-zA-Z]* return EXP;
[0-9]+ return NUM;
[ ] return SPACE;
. return yytext[0];
\n return 0;
%%
