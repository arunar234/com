%{
char stack[100];
int tos=0;
void push(char ch);
void pop(char c);
%}
%%
[a-zA-Z] { pop(yytext[0]); }
("+"|"-"|"/"|"*"|"("|")") { push(yytext[0]); }

%%
void push(char ch){
stack[tos++]=ch;
}
void pop(char c)
{
	if(tos<=0)
	printf("%c",c);
	else
	printf("%c %c ",c,stack[--tos]);
		
}
int yywrap()
{
return 1;
}
int main()
{
yylex();
return 0;
}