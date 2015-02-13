rm -Rf build
rm c_*.so
python setup.py build_ext --inplace
rm *.SUCC


echo "======================== c_foo"
echo "Test c_foo with LD_LIBRARY_PATH set"
LD_LIBRARY_PATH=${PWD}/../c-project python -c "import c_foo; c_foo.useit()"
RESULT=$?
if [ $RESULT -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

echo "Test c_foo without LD_LIBRARY_PATH set, expected failure"
python -c "import c_foo; c_foo.useit()"
RESULT=$?
if [ $RESULT  -eq 0 ]; then
	echo "FAILURE: this test should fail"
else
	echo "SUCCESS (KNOWN FAIL)"
fi

echo "======================== c_bar"
python -c "import c_bar; c_bar.useit()"
RESULT=$?
if [ $RESULT  -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

echo "======================== c_misc - KNOWNFAIL"
echo "Invoke from statically linked c_bar, invokation in c_misc "
python -c "import c_misc; c_misc.usebar()"
RESULT=$?
if [ $RESULT  -eq 0 ]; then
	echo "FAILURE: this test should fail"
else
	echo "SUCCESS (KNOWN FAIL)"
fi

echo "======================== c_with_ptrs "
echo "Invoke from statically linked c_with_ptrs, invokation in c_misc "
python -c "import c_with_ptrs; c_with_ptrs.useit()"
RESULT=$?
if [ $RESULT  -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

echo "======================== c_from "
echo "Invoke from statically linked c_from, invocation by c_from_user"
python -c "import c_from_user; c_from_user.useit()"
RESULT=$?
if [ $RESULT  -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

echo "======================== c_from_w/_direct_comp  "
echo "Invoke from statically linked c_from_with_direct_compilation, invocation by c_from_with_direct_compilation_user"
python -c "import c_from_with_direct_compilation_user; c_from_with_direct_compilation_user.useit()"
RESULT=$?
if [ $RESULT  -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

echo "======================== c_from_w/_direct_comp  "
echo "Invoke from statically linked c_from_with_direct_compilation"
python -c "import c_from_with_direct_compilation; c_from_with_direct_compilation.useit()"
RESULT=$?
if [ $RESULT  -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi
