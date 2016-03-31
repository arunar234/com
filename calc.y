%{
 #include <stdio.h>
 #include<math.h>
int yylex(void);
 void yyerror(char *);
%}
%token INTEGER
%%
program:
  expr { printf("%d\n", $1); }
 |
 ;
expr:
 INTEGER { $$ = $1; }
 | expr '+' expr { $$ = $1 + $3; }
 | expr '-' expr { $$ = $1 - $3; }
 | expr '*' expr { $$= $1 * $3;}
 | expr '^' expr {
	int i; int ans=$1;
	for(i=1;i<$3;i++) ans=ans*$1;
	$$=ans;
} 
;

%%
void yyerror(char *s) {
 fprintf(stderr, "Came%s\n", s);
}
#include "lex.yy.c"
int main(void) {
 yyparse();
 return 0;
} 
