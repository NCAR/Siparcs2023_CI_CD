AC_INIT(MPIStencil, version-0.1)
AC_MSG_NOTICE([Building MPI OpenACC version of MPIStencil])

AC_PATH_PROG([MPICC], [mpic++], [no])

if test "x$MPICC" = xno; then
    AC_MSG_ERROR([mpic++ not found.])
fi

# Set CFLAGS and ACCFLAGS
CFLAGS="-g -O3 -Wall -std=c++11"
ACCFLAGS="-acc -gpu=cc60,cc70,managed -Minfo=all -I${NCAR_ROOT_NVHPC}/include"

AC_SUBST([MPICC])
AC_SUBST([CFLAGS])
AC_SUBST([ACCFLAGS])

AC_OUTPUT(Makefile)
