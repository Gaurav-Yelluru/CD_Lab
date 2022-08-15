%{
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
// extern int yylex();
// extern int yyparse();
extern char* yytext;

void push();
void codegen();
void codegen_umin();
void codegen_assign();

char st[100][10];
int top = 0;
char i_[2] = "0";
char temp[3] = "R";
char x[3]="R1";
char y[3]="R2";
%}

%token ID NUM
%right '='
%left '+''-'
%left '*''/'
%left UMINUS
%%
S: ID{push();}'='{push();} E{codegen_assign();}
;
E: E '+'{push();} T{codegen();}
|E '-'{push();} T{codegen();}
|T
;
T: T '*'{push();} F{codegen();}
|T '/'{push();} F{codegen();}
|F
;
F: '(' E ')'
|'-'{push();} F{codegen_umin();} %prec UMINUS
|ID{push();}
|NUM{push();}
;
%%

void push(){
  strcpy(st[++top],yytext);
}

int main(){
    // i_[0]++;
    // i_[0]++;
    // i_[0]++;
// int push();
// int codegen();
// int codegen_umin();
// int codegen_assign();
    printf("Enter the expression:");
    yyparse();
}

void codegen()
{
    strcpy(temp, "R");
    strcat(temp, i_);
    strcpy(x, "R1");
    strcpy(y, "R2");
    if(st[top-2][0]!='R')
        printf("LD %s %s\n",x,st[top-2]);
    else
        strcpy(x,st[top-2]);
    if(st[top][0]!='R')
        printf("LD %s %s\n",y,st[top]);
    else
        strcpy(y,st[top]);
    if(!strcmp(st[top-1],"+"))
        printf("ADD %s %s\n",x,y);
    else if(!strcmp(st[top-1],"-"))
        printf("SUB %s %s\n",x,y);
    else if(!strcmp(st[top-1],"*"))
        printf("MUL %s %s\n",x,y);
    else if(!strcmp(st[top-1],"/"))
        printf("DIV %s %s\n",x,y);
    else
        printf("OPR %s %s\n",x,y);
    printf("MOV %s %s\n",x,temp);
    top -= 2;
    strcpy(st[top], temp);
    i_[0]++;
    strcpy(x, "R1");
    strcpy(y, "R2");
}

void codegen_umin()
{
    strcpy(x, "R1");
    strcpy(temp, "R");
    strcat(temp, i_);
    if(st[top][0]!='R')
        printf("LD %s %s\n",x,st[top]);
    printf("MUL %s #-1\n",x);
    printf("MOV %s %s",x,temp);
    top--;
    strcpy(st[top], temp);
    i_[0]++;
    strcpy(x, "R1");
}

void codegen_assign()
{
    printf("STR %s %s\n",st[top],st[top-2]);
    top -= 2;
}

int yyerror(char *s){
    printf("Expression Invalid\n");
    exit(0);
}
