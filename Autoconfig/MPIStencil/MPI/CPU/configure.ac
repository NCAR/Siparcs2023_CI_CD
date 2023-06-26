AC_INIT(MPIStencil, version-0.1)
AC_MSG_NOTICE([Building MPI CPU version of MPIStencil])

AC_ARG_VAR([MPI_CXX], [MPIC++ compiler])
CXXFLAGS="-g -O3 -Wall -std=c++11"

AC_PATH_PROG([MPI_CXX], [mpic++])

AC_SUBST([CXXFLAGS])
AC_SUBST([MPI_CXX],[mpic++])

AC_OUTPUT(Makefile)
