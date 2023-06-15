AC_INIT(multrixMult, version-0.1)
AC_MSG_NOTICE([Building fortan version of matrix multiplication])

AC_ARG_VAR([FC], [Fortran compiler])
AC_PATH_PROG([FC], [nvfortran])

FFLAGS="-O3 -Wall -Mfree"

AC_SUBST([FFLAGS])
AC_OUTPUT(Makefile)
