/*****************************************************
*Bison file for zoomjoystrong project (simplified paint)
*
*@author James Cory
*3/11/2018
******************************************************/

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.h"
	void yyerror(const char* msg);
	void endProg();
	int yylex();
%}

%error-verbose
%start program

%union { int i; float f; }

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT

%type<i> INT
%type<f> FLOAT

%%
program: statement_list end;

statement_list:   statement
	|	statement statement_list
	;
statement:		point;
	|		line;
	|		circle;
	|		rectangle;
	|		set_color;
;
point:	POINT INT INT END_STATEMENT
{point($2,$3);}
line:		LINE INT INT INT INT END_STATEMENT
{line($2,$3,$4,$5);}
circle:	CIRCLE INT INT INT END_STATEMENT
{circle($2,$3,$4);}
rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
{rectangle($2,$3,$4,$5);}
set_color:	SET_COLOR INT INT INT END_STATEMENT
{set_color($2,$3,$4);}
end: END END_STATEMENT
{endProg();}	

%%
/*****************************************************
*Prints out an error message in the event of an error
*
*@param int argc- the number of arguements
*@param char** argv - the pointer to the array of strings
*that make up the arguements
******************************************************/


int main(int argc, char** argv){
	setup();
	return (yyparse());
}
/*****************************************************
*Prints out an error message in the event of an error
*
*@param char* msg the pointer to begining of the error
* message
******************************************************/
void yyerror(const char* msg){
	fprintf(stderr, "ERROR! %s\n", msg);
}
void endProg()
{
getchar();
exit(0);
}