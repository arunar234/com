%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int i=0;
%}
%token ID NUM FOR LE GE EQ NE OR AND
%right "="
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%
    
S         : ST {printf("Input accepted\n"); i=1;}
ST       : FOR '(' E ';' E2 ';' E ')' DEF
           ;
DEF    : '{' BODY '}'
           | E';' 
           | ST
           |
           ;
BODY  : BODY BODY
           | E ';'        
           | ST
           |             
           ;
        
E        : ID '=' E 
          | E '+' E 
          | E '-' E
          | E '*' E
          | E '/' E
          | E '<' E
          | E '>' E
          | E LE E
          | E GE E
          | E EQ E
          | E NE E
          | E OR E
          | E AND E
          | E '+' '+' 
          | E '-' '-'
          | ID  
          | NUM
          ;

    
E2     : E'<'E
         | E'>'E
         | E LE E
         | E GE E
         | E EQ E
         | E NE E
         | E OR E
         | E AND E
         ;    
%%

#include "lex.yy.c"
main() {
    
    yyin=fopen("forInput.txt","r+");
    yyparse();
    fclose(yyin);
    if(i==1)
    {
    	FILE *yyin=fopen("forInput.txt","r+"),*yyout=fopen("whileOutput.txt","w");
    	char str[20];int ocb=0;
    	fscanf(yyin,"%s",str);
    	printf("%s",str);
    	while(!feof(yyin))
    	{
    		if(str[0]=='{')
    			fscanf(yyin,"%s",str);
		if(strcmp(str,"for")==0)
		{
			fscanf(yyin,"%s",str);
			int semi=0;
			while(strcmp(str,")")!=0)
			{
				if(str[0]=='(')
					;
				else if(semi==1)
				{
					str[strlen(str)-1]='\0';
					fprintf(yyout,"%s %s %s","while","(",str);
					semi++;
				}
				else if(semi==0)
				{
					fprintf(yyout,"%s\n",str);
					semi++;
				}
				else if(semi==2)
				{
					fprintf(yyout,"%s\n%s"," )","{");
					fprintf(yyout,"\n%s;",str);
				}
				fscanf(yyin,"%s",str);
			}
			str[0]='\n';
		}
		fprintf(yyout,"%s\n",str);
		fscanf(yyin,"%s",str);
    	}
    	fclose(yyout);
    	fclose(yyin);
    }
    else
    	printf("Error in for syntax\n");	
    exit(0);
}
int yywrap()
{
return 1;
}
int yyerror()
{
return 1;
}

