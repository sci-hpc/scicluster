

Running MPI jobs
================

The Rocks HPC roll provide configured software tools that can be used to run parallel applications on Sci-cluster-testing.
The following software packages are included in the HPC Roll:

- MPI over ethernet environments (OpenMPI, MPICH, MPICH2)
- Benchmarks (stream, iperf, IOzone)
- PVM

Rocks OpenMPI
----------------------------

To use, load it as::

   $ module load rocks-openmpi
   
This will define environment variable ``OMP_MCA_btl=self,sm,tcp``. The OpenMPI version is 2.1.1.
See its userguide_ for more details.

.. _userguide: http://central-7-0-x86-64.rocksclusters.org/roll-documentation/hpc/7.0/ 

There are several ways of launching an MPI application within a SLURM
allocation, e.g. ``srun``, ``mpirun``, ``mpiexec``.
Unfortunately, the best way to launch your program depends on the MPI
implementation (and possibly your application), and choosing the wrong command
can severly affect the efficiency of your parallel run. Our recommendation is
the following:

TBA

.. With OpenMPI, ``mpirun`` seems to be working correctly. Also, it seems that
.. ``srun`` fails to launch your application in parallel, so here we recommend
.. using ``mpirun``::

    $ mpirun ./my_application

.. NOTE: If you're running on the ``multinode`` partition you automatically
.. get the ``--exclusive`` flag, e.i. you get allocated (and charged for) **full**
.. nodes, even if you explicitly ask for less resources per node. This is not the
.. case for the ``normal`` partition.
