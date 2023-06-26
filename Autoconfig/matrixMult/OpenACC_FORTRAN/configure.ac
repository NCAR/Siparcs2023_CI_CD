AC_INIT([multrixMult], [0.1])
AC_MSG_NOTICE([Building fortan ACC version of matrix multiplication])

AC_PATH_PROG([FC], [nvfortran], [no])
if test "x$FC" = xno; then
    AC_MSG_ERROR([nvfortran not found.])
fi

FCFLAGS="-O3 -Wall -Mfree"
ACCFLAGS="-acc -gpu=cc60,cc70,cc80,managed -Minfo=all -I[$]NVHPC_ROOT/include"

AC_SUBST([FC])
AC_SUBST([FCFLAGS])
AC_SUBST([ACCFLAGS])

AC_OUTPUT(Makefile)
