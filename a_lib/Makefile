
libfoo_c.so: foo.o
	$(CC) -shared -o libfoo.so foo.o

foo.o: foo.c
	$(CC) -c foo.c

.PHONY: clean


clean:
	rm -f foo.o
	rm -f libfoo.so
