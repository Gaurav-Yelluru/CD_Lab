%{
	#include "y.tab.h"
%}
%%
("int"|"void"|"float"|"long"|"short"|"char") return TYPE;
[A-Za-z]* return ID;
[0-9]+ return NUM;
" " return SPACE;
. return yytext[0];
\n return 0;
%%