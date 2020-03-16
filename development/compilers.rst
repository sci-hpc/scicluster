

Compilers
=========

The default development environment on Sci-cluster-testing is provided by GNU Compiler Collection. The GNU foundation maintains a number of high quality compilers, including a compiler for C (gcc), C++ (g++), and Fortran (gfortran). The gcc compiler is the foundation underneath all three, and the term "gcc" often means the suite of these three GNU compilers.

Version
-------

Currently we provide two version. The default version is ``4.8.5 (Red Hat 4.8.5-16)``. We also provide version ``7.3.1 (Red Hat 7.3.1-5)`` via devtoolset-7. To enable this version, run::

   scl enable devtoolset-7 bash
   
To disable, exit from your bash session ``(ctrl+d)``.


Fortran compilers
-----------------

GNU fortran compiler can be invoked by: ``gfortran``.


Usage of GNU fortran compiler
---------------------------------

For plain Fortran codes (all Fortran standards) the general form
for usage of the gnu fortran compiler is as follows::

  $ gfortran [options] file1 [file2 ...]

where options represents zero or more compiler options, and fileN is a
Fortran source (.f .for .ftn .f90 .fpp .F .FOR .F90), assembly
(.s .S), object (.o), static library (.a), or an other linkable file.

The form above also applies for Fortran codes parallelized with OpenMP
(`www.openmp.org <http://www.openmp.org/>`_,
`Wikipedia <https://en.wikipedia.org/wiki/OpenMP>`_); you only have to
select the necessary compiler options for OpenMP.

For Fortran codes parallelized with MPI the general form is quite
similar::

  $ mpif90 [options] file1 [file2 ...]

The wrapper mpif90 is using the gfortran compiler and invokes all the
necessary MPI machinery automatically for you.  Therefore, everything else is
the same for compiling MPI codes as for compiling plain Fortran codes.


C and C++ compilers
-------------------

GNU C/C++ compiler can be invoked by: ``gcc`` and ``g++`` correspondingly.


Usage of GNU C/C++ compilers
----------------------------------

For plain C/C++ codes the general form for usage of the GNU
gcc/g++ compilers are as follows::

  $ gcc  [options] file1 [file2 ...]  # for C
  $ g++ [options] file1 [file2 ...]  # for C++

where options represents zero or more compiler options, fileN is a
C/C++ source (.C .c .cc .cpp .cxx .c++), assembly (.s .S), object
(.o), static library (.a), or other linkable file. Commonly used options
may be placed in the icc.cfg file (C) or the icpc.cfg (C++).

The form above also applies for C/C++ codes parallelized with OpenMP
(`www.openmp.org <http://www.openmp.org/>`_,
`Wikipedia <https://en.wikipedia.org/wiki/OpenMP>`_); you only have to
select the necessary compiler options for OpenMP.

For C/C++ codes parallelized with MPI the general form is quite
similar::

  $ mpicc [options] file1 [file2 ...]  # for C when using OpenMPI
  $ mpic++ [options] file1 [file2 ...]  # For C++ when using OpenMPI

Both mpicc and mpic++ are using the GNU compilers, they are just
wrappers that invoke all the necessary MPI machinery automatically for
you. Therefore, everything else is the same for compiling MPI codes as
for compiling plain C/C++ codes.
