
GCC:=gcc
RM:=rm
MAKE:=make
I:=-I ./header/


default:
	${MAKE} img
	${MAKE} clean


run:
	${MAKE} img
	${MAKE} clean
	./zlang

img: zlang.o util.o makefile
	${GCC} zlang.o util.o -o zlang

%.o: %.c makefile
	${GCC} -c $*.c -o $*.o ${I}

clean:
	${RM} *.o
