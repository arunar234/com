%{
#include <stdio.h>
#include<stdlib.h>
int invalid=0;
int number=0;
int dot=0;int check=0;
%}
DIGIT [0-9]
NUMBER {DIGIT}+
DELIMITER [.]
%%
{NUMBER} {
if(atoi(yytext) >255)
{
invalid=1;
}
else
{
if(check==0)
{     
	if(atoi(yytext)>=1 && atoi(yytext)<=127)
	{
	printf("CLASS A");
	}
	if(atoi(yytext)>=128 && atoi(yytext)<=191)
	{
	printf("CLASS B");
	}
	if(atoi(yytext)>=192 && atoi(yytext)<=223)
	{
	printf("CLASS C");
	}
	if(atoi(yytext)>=224 && atoi(yytext)<=239)
	{
	printf("CLASS D");
	}
	if(atoi(yytext)>=240 && atoi(yytext)<=255)
	{
	printf("CLASS E");
	}
	check=1;
}
number++;
}
}
{DELIMITER} {dot++;}
%%
int main(int argc, char *argv[]) {
yylex();
if(invalid==1) printf("INVALID");
else
{
if(dot==3 && number==4) printf("VALID");
}
return 0;
}
