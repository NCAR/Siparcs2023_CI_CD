AC_INIT([multrixMult], [0.1])
AC_MSG_NOTICE([Building C++ ACC version of matrix multiplication])

AC_PATH_PROG([CC], [nvc++], [no])
if test "x$CC" = xno; then
    AC_MSG_ERROR([nvc++ not found.])
fi

AC_ARG_VAR([CFLAGS], ["-g -O3 -Wall -std=c++11"])
AC_ARG_VAR([ACCFLAGS], ["-acc -gpu=cc60,cc70,managed -Minfo=all -I${NVHPC_ROOT_PATH}/include"])

AC_SUBST([CC])
AC_SUBST([CFLAGS])
AC_SUBST([ACCFLAGS])

AC_OUTPUT(Makefile)
