%{
#include<stdio.h>
#include<ctype.h>

void ThreeAddressCode();
void Triples();
void Quadruples();
char AddToTable(char,char,char);

int ind=0;
char temp='A';
struct incod{
char opd1;
char opd2;
char op;
};
%}
%union{
    char sym;
}
%token <sym> LETTER NUMBER
%type <sym> expr
%left '+' '-'
%left '*' '/'
%%
S:LETTER '=' expr ';' {AddToTable((char)$1,(char)$3,'=');}
|expr ';'
;
expr:expr '+' expr {$$=AddToTable((char)$1,(char)$3,'+');}
|expr '-' expr {$$=AddToTable((char)$1,(char)$3,'-');}
|expr '*' expr {$$=AddToTable((char)$1,(char)$3,'*');}
|expr '/' expr {$$=AddToTable((char)$1,(char)$3,'/');}
|'(' expr ')' {$$=(char)$2;}
|NUMBER {$$=(char)$1;}
|LETTER {$$=(char)$1;}
;
%%
int yyerror(char *s){
    printf("%s",s);
}

struct incod code[20]; 
int id=0;

char AddToTable(char opd1,char opd2,char op){
    code[ind].opd1=opd1;
    code[ind].opd2=opd2;
    code[ind].op=op;
    ind++;
    temp++;
    return temp;
}

void ThreeAddressCode(){
    int cnt=0;
    printf("\n TAC \n");
    while(cnt<ind){
        if(cnt!=ind-1)
            printf("%c\t =\t",temp);
        printf("%c\t",code[cnt].opd1);
        printf("%c\t",code[cnt].op);
        printf("%c\t",code[cnt].opd2);
        printf("\n");
        temp++;
        cnt++;
    }
}

void Quadruples(){
    int cnt=0;
    printf("Quadruples \n");
    while(cnt<ind){
        if(cnt==ind-1){
            printf("%c\t",code[cnt].op);
            printf("%c\t\t",code[cnt].opd2);
            printf("%c\t",code[cnt].opd1);
        }
        else{
            printf("%c\t",code[cnt].op);
            printf("%c\t",code[cnt].opd1);
            printf("%c\t",code[cnt].opd2);
            printf("%c\t",temp);
        }
        printf("\n");
        cnt++;
        temp++;
    }
}

void Triples(){
    int cnt=0,cnt1,id=0;
    printf("Triples\n");
    while(cnt<ind){
        printf("%d \t",id);
        printf("%c\t",code[cnt].op);
        if(isupper(code[cnt].opd1))
            printf("%d\t",code[cnt].opd1 -'A');
        else
            printf("%c\t",code[cnt].opd1);
        if(isupper(code[cnt].opd2))
            printf("%d\t",code[cnt].opd2 -'A');
        else
            printf("%c\t",code[cnt].opd2);
        printf("\n");
        cnt++;
        temp++;
        id++;
    }
}

int main(){
    printf("Enter the Expresssion :\n");
    yyparse();
    temp='A';
    ThreeAddressCode();
    temp='A';
    Quadruples();
    temp='A';
    Triples();
    temp='A';
    return 0;
}
yywrap(){ return 1; }
