

from distutils.core import setup, Extension

from Cython.Build import cythonize

import os.path

extensions = [
        Extension("*", ["c_foo.pyx"],
            include_dirs=[os.path.abspath("../a_lib")],
            library_dirs=[os.path.abspath("../a_lib")],
            libraries=["foo"]),
        Extension("*", ["c_bar.pyx"],
            extra_link_args=["../a_lib/foo.o"]),
        Extension("*", ["c_misc.pyx"]),
        Extension("*", ["c_from.pyx"],
            include_dirs=[os.path.abspath("../a_lib")],
            extra_link_args=["../a_lib/foo.o"]),
        Extension("*", ["c_from_user.pyx"],
            include_dirs=[os.path.abspath("../a_lib")],
            ),
        Extension("*", ["c_with_ptrs.pyx"],
            extra_link_args=["../a_lib/foo.o"]),
        Extension("*", ["c_from_with_direct_compilation.pyx",
                        "../a_lib/foo.c"],
            include_dirs=[os.path.abspath("../a_lib")]),
        Extension("*", ["c_from_with_direct_compilation_user.pyx"],
            include_dirs=[os.path.abspath("../a_lib")])
        ]

setup(name='cython-test-project',
      version='1.0',
      author='Holger Peters',
      ext_modules=cythonize(extensions)
     )
