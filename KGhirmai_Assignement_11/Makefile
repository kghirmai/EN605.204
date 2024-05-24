All: RecurMult RecurFib
LIB=LibFunc.o
CC=gcc

RecurMult: RecurMult.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

RecurFib: RecurFib.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
