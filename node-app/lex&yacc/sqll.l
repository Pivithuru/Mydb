%{
#include <stdio.h>
#include "sqly.h"
#include "sqlhelper.h"

void yyerror(char *);
int numchar = 1;
%}

%%
create					{printf("CREATE\n");numchar+=6;return CREATE;}
table 					{printf("TABLE\n");numchar+=5;return TABLE;}
column 					{printf("COLUMN\n");numchar+=6;return COLUMN;}
in 						{printf("IN\n");numchar+=2;return IN;}
type					{printf("TYPE\n");numchar+=4;return TYPE;}
insert 					{printf("INSERT\n");numchar+=6;return INSERT;}
into 					{printf("INTO\n");numchar+=4;return INTO;}
values					{printf("VALUES\n");numchar+=6;return VALUES;}
select					{printf("SELECT\n");numchar+=6;return SELECT;}
from 					{printf("FROM\n");numchar+=4;return FROM;}
where					{printf("WHERE\n");numchar+=5;return WHERE;}
delete 					{printf("DELETE\n");numchar+=6;return DELETE;}

int						{printf("INTTYPE\n");numchar+=3;return INTTYPE;}
double					{printf("DOUBLETYPE\n");numchar+=6;return DOUBLETYPE;}
string					{printf("STRINGTYPE\n");numchar+=6;return STRINGTYPE;}

and 					{printf("AND\n");numchar+=3;return AND;}
or 						{printf("OR\n");numchar+=2;return OR;}
not 					{printf("NOT\n");numchar+=3;return NOT;}
like 					{printf("LIKE\n");numchar+=4;return LIKE;}

max 					{printf("MAX\n");numchar+=3;return MAX;}
min 					{printf("MIN\n");numchar+=3;return MIN;}
sum 					{printf("SUM\n");numchar+=3;return SUM;}
avg 					{printf("AVG\n");numchar+=3;return AVG;}
count 					{printf("COUNT\n");numchar+=5;return COUNT;}

[/*]					{printf("ALL\n");numchar+=1;return ALL;}
","						{printf("COMMA\n");numchar+=1;return COMMA;}
"'"						{printf("SINGLE QUOTE\n");numchar+=1;return SIQT;}
"("						{printf("OPEN BRACKET\n");numchar+=1;return OPBR;}
")"						{printf("CLOSE BRACKET\n");numchar+=1;return CLBR;}
";"						{printf("SEMICOLON\n");numchar+=1;return SECL;}

"="						{printf("EQUAL\n");numchar+=1;return EQ;}
">"						{printf("GREATER THAN\n");numchar+1;return GT;}
"<"						{printf("LESS THAN\n");numchar+=1;return LT;}
">="					{printf("GREATER THAN OR EQUAL\n");numchar+=2;return GE;}
"<="					{printf("LESS THAN OR EQUAL\n");numchar+=2;return LE;}
"!="					{printf("NOT EQUAL\n");numchar+=2;return NE;}

[A-Za-z][A-Za-z0-9_]*	{printf("IDENTIFIER\n");numchar+=yyleng;printf("%s\n",yytext);yylval.string = strdup(yytext);return IDENTIFIER;}
[0-9]+					{printf("INT\n");numchar+=yyleng;printf("%d\n",numchar);yylval.iValue = atoi(yytext);return INTNUM;}
[0-9]+"."[0-9]* 		{printf("DOUBLE\n");numchar+=yyleng;printf("%d\n",numchar);yylval.iValue = atof(yytext);return DOUBLE;}

[ \t\r]					{numchar+=1;}
[\n]					{yylineno++;numchar=1;}
.						{yyerror("UNRECOGNIZED CHARACTER ");}
%%	

int yywrap() {
	return 1;
}
