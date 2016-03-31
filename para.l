%{
#include <stdio.h>
int i=0;
%}

open "{"
close "}"

%%
{open} {i++;}
{close} {i--;
if(i<0) {
printf("Parenthesis mismatch...");
exit(0);
}
}
. ;
%%

main() /*** File name can be given in-line ***/
{
yyin=fopen("anu.txt","r+"); /*** Open the file ***/
yylex();
if(i==0)
printf("All parenthesis are matched...");
}

int yywrap(void)
{
return 1;
}

