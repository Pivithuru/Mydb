LEX = flex -i
YACC = bison -dv
CFLAGS = -DYYDEBUG=1

all: 
	${LEX} sqll.l
	${YACC} sqly.y
	mv sqly.tab.h sqly.h
	mv sqly.tab.c sqly.c
	mv sqly.output sql.output
	mv lex.yy.c sqll.c	
	gcc -o sql sqll.c sqly.c sqlhelper.c
	mv sql ../

clean:
	rm sqly.h sqly.c sqll.c sql.output ../sql
