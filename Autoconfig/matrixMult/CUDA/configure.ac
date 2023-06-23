AC_INIT([multrixMult], [0.1])
AC_MSG_NOTICE([Building c++ CUDA version of matrix multiplication])

AC_PATH_PROG([CC], [nvc++], [no])
AC_PATH_PROG([CUDACC], [nvcc], [no])
if test "x$CC" = xno; then
    AC_MSG_ERROR([nvc++ not found.])
fi
if test "x$CUDACC" = xno; then
    AC_MSG_ERROR([nvcc not found.])
fi


AC_ARG_VAR([CFLAGS], ["-g -O3 -Wall -std=c++11"])
AC_ARG_VAR([CUDAFLAGS], ["-g -std=c++11 -O3 -I[$]NVHPC_ROOT_PATH/include"])

AC_SUBST([CC])
AC_SUBST([CUDACC])
AC_SUBST([CUDAFLAGS])
AC_SUBST([CFLAGS])

AC_OUTPUT(Makefile)
