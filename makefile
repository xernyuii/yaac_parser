test: lex.yy.o y.tab.o 
	gcc lex.yy.o y.tab.o -o test

lex.yy.o: lex.yy.c y.tab.h
	gcc -c lex.yy.c -o lex.yy.o

y.tab.o: y.tab.c 
	gcc -c y.tab.c -o y.tab.o

y.tab.c y.tab.h: test.y
	yacc -d test.y

lex.yy.c: test.l
	flex test.l

clean:
	rm lex.yy.o y.tab.o y.tab.c lex.yy.c y.tab.h
