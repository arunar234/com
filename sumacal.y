%{
#include<stdio.h>
#include<stdlib.h>
%}
%token IN
%token plus
%token minus
%token mul
%token div
%token un
%left plus minus
%left mul div
%right '^'

%%
s: e {printf("The answer is:%d",$1);}
|
;
e: IN {$$=$1;}
| un e { $$=$2+1; }
| e un { $$= $1+1; }
| e minus e { $$=$1 - $3;}
| e plus e { $$=$1 + $3;}
| e mul e { $$=$1 * $3;}
| e div e { $$=$1 / $3;}
|'(' e ')'{ $$=$2; }
| e '^' e {
	int i,ans=$1;
	for(i=1;i<$3;i++) ans=ans*$1;
	$$=ans;
} 
|
;

%%
#include "lex.yy.c" 
int main()
{
yyparse();
return 0;
}
int yyerror(char *s)
{
printf("%s ",s);
} 
int yywrap()
{
return 1;}
