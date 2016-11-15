%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
create					{printf("CREATE1\n");return CREATE;}
CREATE 					{printf("CREATE2\n");return CREATE;}
table 					{printf("TABLE1\n");return TABLE;}
TABLE 					{printf("TABLE2\n");return TABLE;}
column 					{printf("COLUMN1\n");return COLUMN;}
COLUMN 					{printf("COLUMN2\n");return COLUMN;}
in 						{printf("IN1\n");return IN;}
IN 						{printf("IN2\n");return IN;}
type					{printf("TYPE1\n");return TYPE;}
TYPE 					{printf("TYPE2\n");return TYPE;}
insert 					{printf("INSERT1\n");return INSERT;}
INSERT 					{printf("INSERT2\n");return INSERT;}
into 					{printf("INTO1\n");return INTO;}
INTO 					{printf("INTO2\n");return INTO;}
values					{printf("VALUES1\n");return VALUES;}
VALUES 					{printf("VALUES2\n");return VALUES;}
select					{printf("SELECT1\n");return SELECT;}
SELECT 					{printf("SELECT2\n");return SELECT;}
from 					{printf("FROM1\n");return FROM;}
FROM 					{printf("FROM2\n");return FROM;}
where					{printf("WHERE1\n");return WHERE;}
WHERE 					{printf("WHERE2\n");return WHERE;}
delete 					{printf("DELETE1\n");return DELETE;}
DELETE 					{printf("DELETE2\n");return DELETE;}
string					{printf("STRING1\n");return STRING;}
STRING 					{printf("STRING2\n");return STRING;}

and 					{printf("AND1\n");return AND;}
AND 					{printf("AND2\n");return AND;}
or 						{printf("OR1\n");return OR;}
OR 						{printf("OR2\n");return OR;}
not 					{printf("NOT1\n");return NOT;}
NOT 					{printf("NOT2\n");return NOT;}
like 					{printf("LIKE1\n");return LIKE;}
LIKE 					{printf("LIKE2\n");return LIKE;}

max 					{printf("MAX1\n");return MAX;}
MAX 					{printf("MAX2\n");return MAX;}
min 					{printf("MIN1\n");return MIN;}
MIN 					{printf("MIN2\n");return MIN;}
sum 					{printf("SUM1\n");return SUM;}
SUM 					{printf("SUM2\n");return SUM;}
avg 					{printf("AVG1\n");return AVG;}
AVG 					{printf("AVG2\n");return AVG;}
count 					{printf("COUNT1\n");return COUNT;}
COUNT 					{printf("COUNT2\n");return COUNT;}

[/*]					{printf("ALL\n");return ALL;}
","						{printf("COMMA\n");return COMMA;}
"'"						{printf("SINGLE QUOTE\n");return SIQT;}
"("						{printf("OPEN BRACKET\n");return OPBR;}
")"						{printf("CLOSE BRACKET\n");return CLBR;}
";"						{printf("SEMICOLON\n");return SECL;}

"="						{printf("EQUAL\n");return EQ;}
">"						{printf("GREATER THAN\n");return GT;}
"<"						{printf("LESS THAN\n");return LT;}
">="					{printf("GREATER THAN OR EQUAL\n");return GE;}
"<="					{printf("LESS THAN OR EQUAL\n");return LE;}
"!="					{printf("NOT EQUAL\n");return NE;}

[A-Za-z][A-Za-z0-9_]*	{printf("IDENTIFIER\n");return IDENTIFIER;}
[0-9]+					{printf("INT\n");return INTNUM;}
[0-9]+"."[0-9]* 		{printf("DOUBLE\n");return DOUBLE;}
[ \t\n\r]				;
.						{printf("UNRECOGNIZED CHARACTER\n");}
%%	

int yywrap() {
	return 1;
}