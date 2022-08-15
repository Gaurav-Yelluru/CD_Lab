%{
    #include<stdio.h>
    int id=0,k=0,op=0;
%}
%%
("int"|"float"|"auto"|"const"|"double"|"short"|"struct"|"unsigned"|"break"|"continue"|"else"|"if"|"for"|"long"|"signed"|"switch"|"void"|"case"|"default"|"enum"|"goto"|"register"|"sizeof"|"char"|"return"|"while"|"do") {printf("Keyword\n");k++;}
"#"[a-zA-Z]+.* ;
\".*\" ;
[\n] ;
[a-zA-Z_][a-zA-Z_0-9]* {printf("Identifier\n");id++;}
("+"|"-"|"*"|"/"|"<"|">"|"="|"=="|"<="|">="|"!=") {printf("Operator\n");op++;}
. ;
%%
int main()
{
    yyin=fopen("d.c","r");
    yylex();
    printf("No. of identifiers=%d, keywords=%d,operators=%d\n",id,k,op);
    return 0;
}
int yywrap(){ return 1; }
