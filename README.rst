Example for Linking to C-Library with Cython
============================================

This example demonstrates how a C library can link to a Cython library and
where it fails. This demo is for educational purposes and should also serve as
a basis for discussion.

To compile and test::

   cd a_lib
   make
   cd ../cython-project
   bash test.sh

Insights
--------

- ``LD_LIBRARY_PATH`` issues make dynamic linking a bad experience when you do
  not want to install the non-cython shared library in ``/usr/lib`` or other
  system folders.
- Statically linking object files of that library into your cython library does
  work, however these symbols cannot be interfaced by other libraries with
  ``cimport`` as one would expect. The underlying reason for this is, that
  extern function declarations keep the original name (as in C), in contrast,
  Cython-cdef-functions are name-mangled.

  .. code-block:: python

     cdef return_42():
         return 42

  is name mangled to ``__pyx_f_6c_from_return_42`` for example when defined in
  the pyx.

- Workable solution: PXD-exported function pointers are interfaceable by other
  cython modules and ``cimport`` works. This means that the implementation of
  the wrapper has to feature lots of assignments and new function names have to
  be devised.
