/*****************************************************
*Lex file for zoomjoystrong project (simplified paint)
*
*@author James Cory
*3/11/2018
******************************************************/

%{
	#include "zoomjoystrong.tab.h"
	#include <stdlib.h>
	#include <stdio.h>
%}

%option noyywrap

%%

[0-9]+			{ yylval.i = atoi(yytext); return INT; }

[0-9]+\.[0-9]+		{ yylval.f = atof(yytext); return FLOAT; }

point				{ return POINT; }

line				{ return LINE; }

circle			{ return CIRCLE; }

rectangle			{ return RECTANGLE; }

set_color			{ return SET_COLOR; }

end				{ return END; }

\;				{ return END_STATEMENT; }

[ \t\n]                 ;
.                       ;				;

%%