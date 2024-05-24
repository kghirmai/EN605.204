All: isPrime guessRand
CC=gcc

isPrime: isPrime.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

guessRand: guessRand.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
