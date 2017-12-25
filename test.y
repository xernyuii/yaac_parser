%token Realnumber Plus Minus
%{
	#include<stdio.h>
%}
%%
statement : 
	  |	statement expression
	  |	statement expression '\n'
	  ;				
expression : Realnumber Plus Realnumber 
		{ printf("%d add %d is %d\n",$1,$3,$1+$3);}
expression : Realnumber Minus Realnumber 
		{ printf("%d cut %d is %d\n",$1,$3,$1-$3);}
%%
int main()
{
	yyparse();
	return 0;
}
int yyerror(char *msg)
{
	printf("Error:%s \n", msg);
}
