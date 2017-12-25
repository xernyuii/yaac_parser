%{
	#include"y.tab.h"
%}
%option noyywrap
%%
[0-9]+		{	yylval = atoi(yytext);
			return(NUM);	}
"+"		{	return(ADD);	}
"-"		{	return(SUB);	}
"*"		{	return(MUL)}
"/" 	{	return(DIV)}
"("		{	return(LB)}
")"		{	return(RB)}
"\n"	{	return '\n' ;}
.		{	return yytext[0];}
%%
