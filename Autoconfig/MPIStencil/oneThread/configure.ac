AC_INIT(MPIStencil, version-0.1)
AC_MSG_NOTICE([Building MPI CPU version of MPIStencil])

AC_PATH_PROG([CC], [nvc++], [no])
if test "x$CC" = xno; then
    AC_MSG_ERROR([nvc++ not found.])
fi

CFLAGS="-g -O3 -Wall -std=c++11"
ACCFLAGS="-acc -gpu=cc60,cc70,managed -Minfo=all -I${NCAR_ROOT_NVHPC}/include"

AC_SUBST([CC])
AC_SUBST([CFLAGS])
AC_SUBST([ACCFLAGS])

AC_OUTPUT(Makefile)
