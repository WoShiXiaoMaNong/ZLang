
GCC:=gcc
I:=-I ./header/
LEX:=lex
MAKE:=make
default:
	${MAKE} lexImg
#	${MAKE} clean

lexImg:tiger.o errormsg.o util.o
	${GCC} -o lexImg tiger.o util.o errormsg.o -ll

tiger.c: tiger.lex makefile
	${LEX} -o tiger.c tiger.lex

%.o: %.c makefile
	${GCC}  -c $*.c -o $*.o ${I} -ll

clean:
	rm *.o
	rm tiger.c
