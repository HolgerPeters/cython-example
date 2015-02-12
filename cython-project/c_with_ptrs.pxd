
cdef extern:
    int clib_return_3(int);

cdef:
    int (*return_3)(int);
