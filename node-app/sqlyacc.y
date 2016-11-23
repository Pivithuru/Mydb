%{
#include <stdio.h>
#include <stdlib.h>
%}

%{
extern int yylineno;
extern int numchar;
void yyerror(char *);
%}

%union {
    int iValue;                 /* integer value */
    char *string;                /* symbol table index */
    double dvalue;				/* double value */
}

%left AND OR NOT
%left GE LE EQ NE GT LT

%token CREATE TABLE COLUMN TYPE INSERT INTO VALUES SELECT FROM WHERE DELETE LIKE STRINGTYPE INTTYPE DOUBLETYPE IN
%token MAX MIN SUM AVG COUNT
%token ALL COMMA SIQT OPBR CLBR SECL
%token <string> IDENTIFIER 
%token <iValue> INTNUM 
%token <dValue> DOUBLE

%%

sql_list:
	sql
	|sql sql_list
	;

sql:	
	create_statement	{printf("Correct create statement\n");}
	|insert_statement	{printf("Correct insert statement\n");}
	|select_statement	{printf("Correct select statement\n");}
	|delete_statement	{printf("Correct delete statement\n");}
	;

create_statement:
	create_table
	|create_column
	;

create_table:
	CREATE TABLE table_name SECL
	;

table_name:
	IDENTIFIER
	;

create_column:
	CREATE COLUMN column_name column_type IN table_name SECL
	;

column_name:
	IDENTIFIER
	;

column_type:
	INTTYPE
	|DOUBLETYPE
	|string_type
	;

string_type:
	STRINGTYPE OPBR size CLBR
	;

size:
	INTNUM
	;

insert_statement:
	INSERT INTO table_name column_comma_list VALUES value_comma_list SECL
	|INSERT INTO table_name VALUES value_comma_list SECL
	;

column_comma_list:
	OPBR column_list CLBR
	;

column_list:
	column
	|column_list COMMA column
	;

column:
	IDENTIFIER
	;

value_comma_list:
	OPBR value_list CLBR
	;

value_list:
	value
	|value_list COMMA value
	;

value:
	INTNUM
	|DOUBLE
	|SIQT IDENTIFIER SIQT
	;

select_statement:
	SELECT ALL FROM table_name SECL
	|SELECT ALL FROM table_name where_clause SECL
	|SELECT column_comma_list FROM table_name SECL
	|SELECT column_comma_list FROM table_name where_clause SECL
	|SELECT aggregate_function FROM table_name SECL
	|SELECT aggregate_function FROM table_name where_clause SECL
	;

where_clause:
	WHERE where_condition
	;

where_condition:
	comparison
	| where_condition logic_function comparison
	;

comparison:
	lval compare_function rval
	;

lval:
	IDENTIFIER
	;

rval:
	INTNUM
	|DOUBLE
	|SIQT IDENTIFIER SIQT
	;

logic_function:
	AND
	|OR
	;

compare_function:
	EQ
	|NE
	|LT
	|GT
	|LE
	|GE
	|LIKE
	;

aggregate_function:
	func_name OPBR column CLBR
	|count_func OPBR column CLBR
	|count_func OPBR ALL CLBR
	;

count_func:
	COUNT
	;

func_name:
	MIN
	|MAX
	|SUM
	|AVG	
	;



delete_statement:
	DELETE column FROM table_name SECL
	|DELETE column FROM table_name where_clause SECL
	;

%%

void yyerror(char *s) {
	fprintf(stderr, "%s in line %d before column %d\n", s, yylineno, numchar);
}

int main(void) {
	yyparse();
	return 0;
}


