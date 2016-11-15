%{
#include <stdio.h>
#include <stdlib.h>
%}

%{
void yyerror(char *);
%}

%left AND OR NOT
%left EQ NE LT GT LE GE

%token CREATE TABLE COLUMN TYPE INSERT INTO VALUES SELECT FROM WHERE DELETE LIKE STRING IN
%token MAX MIN SUM AVG COUNT
%token ALL COMMA SIQT OPBR CLBR SECL
%token IDENTIFIER INTNUM DOUBLE

%%

sql:
	|create_statement	{printf("Correct create statement\n");}
	|insert_statement	{printf("Correct insert statement\n");}
	|select_statement	{printf("Correct select statement\n");}
	|delete_statement	{printf("Correct delete statement\n");}
	;

create_statement:
	create_table
	|create_column
	;

create_table:
	CREATE TABLE table_name line_breaker
	;

line_breaker:
	|SECL
	;

table_name:
	IDENTIFIER
	;

create_column:
	CREATE COLUMN column_name column_type IN table_name line_breaker
	;

column_name:
	IDENTIFIER
	;

column_type:
	INTNUM
	|DOUBLE
	|string_type
	;

string_type:
	STRING OPBR size CLBR
	;

size:
	INTNUM
	;

insert_statement:
	INSERT INTO table_name column_comma_list VALUES value_comma_list line_breaker
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
	SELECT ALL FROM table_name where_clause line_breaker
	|SELECT column_comma_list FROM table_name where_clause line_breaker
	|SELECT aggregate_function FROM table_name where_clause line_breaker
	;

where_clause:
	|WHERE where_condition
	|WHERE where_clause where_condition
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
	DELETE column FROM table_name where_clause line_breaker
	;

%%

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}

int main(void) {
	yyparse();
	return 0;
}


