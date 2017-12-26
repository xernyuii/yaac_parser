%token ADD SUB MUL DIV CR LB RB CL NUM
%{
	#include<stdio.h>
%}
%%
LINES
	: LINE
	| LINES LINE
	;

LINE
	: EXPR CL
	{
		printf("\n");
	}
	;

EXPR 
	: TERM
	| EXPR ADD TERM
	{	
		$$ = $1 + $3;
		printf("%d + %d = %d  ", $1, $3, $1+$3);
	}
	| EXPR SUB TERM
	{	
		$$ = $1 - $3;
		printf("%d - %d = %d  ", $1, $3, $1-$3);
	}

	;

TERM
	: PRIME
	| TERM MUL PRIME
	{
		$$ = $1 * $3;
		printf("%d * %d = %d  ", $1, $3, $1*$3);
	}
	| TERM DIV PRIME
	{	
		$$ = $1 / $3;
		printf("%d / %d = %d  ", $1, $3, $1/$3);
	}
	;

PRIME
	: NUM
	| LB EXPR RB
	{
		$$ = $2;
	}
	| SUB NUM
	{
		$$ = - $2;
	}
	;



%%
int main()
{
	yyparse();
	return 0;
}
int yyerror(char *msg)
{
	printf(" ", msg);
}
