%{                                                                        
        #include<stdio.h>                                                
%}                                                                       
%token   a      b
%%                                                                        
Stmt    : TERM   '\n'     {  printf ( "\n string belongs to grammar..\n" );  exit(0); }        
            |  error   '\n'     {  yyerror ( "\n String does not belong to grammar..\n" ); }
            ;
TERM: a TERM b                                                           
           |                                                                
            ;
%%                                                                       

main ( )                                                                   
{                                                                         
        printf ( "ENTER String for GRAMMER a^nb^n : \n"  );                              
        yyparse ( );                                                       
}                       

yylex ( )                                                                  
{                                                                        
        char ch;                                                         
        while ( ( ch = getchar() ) == '  ' );
        if ( ch == 'a' )                       
                return a;                 
        if ( ch == 'b' )                       
                return b;                 
        return ch;                        
}               
                         
yyerror (char *s)                          
{                                         
        printf ( "%s", s);                   
}                                         



