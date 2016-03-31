%{
#include<stdio.h>
#include<stdlib.h>
int yyerror(char *);
%}
%%
[0-9]+ { yylval=atoi(yytext); return IN;}
"+" return plus;
"-" return minus;
"*" return mul;
"/" return div;
"++" return un;
[ \t\n] ;
. yyerror("FUck ofF Invalid");
%%

