SLURM Workload Manager
======================

`SLURM <https://slurm.schedmd.com/>`_ is the workload manager and job scheduler used for Scicluster.

There are two ways of starting jobs with SLURM; either interactively with ``srun``
or as a script with ``sbatch``.

Interactive jobs are a good way to test your setup before you put it into a script
or to work with interactive applications like python.
You immediately see the results and can check if all parts behave as you expected.
See :ref:`interactive` for more details.


.. _slurmparameter:

SLURM Parameter
---------------

`SLURM <https://slurm.schedmd.com/>`_ supports a multitude of different parameters.
This enables you to effectivly tailor your script to your need when using Scicluster
but also means that it is easy to be confused and waste your time and quota.

The following parameters can be used as command line parameters with ``sbatch`` and
``srun`` or in jobscript, see :ref:`job_script_examples`.
To use it in a jobscript, start a newline with ``#SBTACH`` followed by the parameter.
Replace <....> with the value you want, e.g. ``--job-name=test-job``.


Basic settings:
+++++++++++++++

=======================================  ================================================================================
Parameter                                 Function
=======================================  ================================================================================
``--job-name=<name>`` or ``-J <name>``    Job name to be displayed by for example ``squeue`` command
``--output=<path>`` or ``-o <name>``      Path to the file where the job  output is written to
``--error=<path>`` or ``-e <name>``       Path to the file where the job  error is written to
``--mail-type=<type>``                    Turn on mail notification; type can be one of BEGIN, END, FAIL, REQUEUE or ALL
``--mail-user=<email_address>``           Email address to send notifications to
=======================================  ================================================================================


Requesting Resources
+++++++++++++++++++++

=============================================    ==============================================================================================================================
Parameter                                        Function
=============================================    ==============================================================================================================================
``--time=<d-hh:mm:ss>``                          Time limit for job. Job will be killed by SLURM after time has run out. Format days-hours:minutes:seconds
``--nodes=<num_nodes>`` or ``-N=<num_nodes>``    Number of nodes. Multiple nodes are only useful for jobs with distributed-memory (e.g. MPI).
``--mem=<MB>``                                   Memory (RAM) per node. Number followed by unit prefix, e.g. 16G
``--mem-per-cpu=<MB>``                           Memory (RAM) per requested CPU core
``--ntasks-per-node=<num_procs>``                Number of (MPI) processes per node. More than one useful only for MPI jobs. Maximum number is node dependent (number of cores)
``--cpus-per-task=<num_threads>``                CPU cores per task. For MPI use one. For parallelized applications benchmark this is the number of threads.
``--exclusive``                                  Job will not share nodes with other running jobs. You will be charged for the complete nodes even if you asked for less.
=============================================    ==============================================================================================================================


Accounting
+++++++++++++++++++++
See also :ref:`label_partitions`.

================================      ==========================================================================================================
Parameter                             Function
================================      ==========================================================================================================
``--account=<name>``                  Project (not user) account the job should be charged to.
``--partition=<name>`` or ``-p``      Partition/queue in which o run the job.
``--qos=<...>``                       low, normal or high
================================      ==========================================================================================================


Advanced Job Control
+++++++++++++++++++++

==============================   ==================================================================================================================================================================
Parameter                        Function
==============================   ==================================================================================================================================================================
``--array=<indexes>``            Submit a collection of similar jobs, e.g. ``--array=1-10``. (sbatch command only). See official `SLURM documentation <https://slurm.schedmd.com/job_array.html>`_
``--dependency=<state:jobid>``   Wait with the start of the job until specified dependencies have been satified. E.g. --dependency=afterok:123456
``--ntasks-per-core=2``          Enables hyperthreading. Only useful in special circumstances.
==============================   ==================================================================================================================================================================


Differences between CPUs and tasks
-------------------------------------

As a new users writing your first SLURM job script the difference between
``--ntasks`` and ``--cpus-per-task`` is typically quite confusing.
Assuming you want to run your program on a single node with  16 cores, which
SLURM parameters should you specify?

The answer is it depends whether your application supports MPI.
MPI (message passing protocol) is a communication interface used for developing
parallel computing programs on distributed memory systems.
This is necessary for applications running on multiple computers (nodes) to be able to
share (intermediate) results.

To decide which set of parameters you should use, check if your application utilizes
MPI and therefore would benefit from running on multiple nodes simultaneously.
On the other hand you have an non-MPI enables application or made a mistake in
your setup, it doesn't make sense to request more than one node.



Settings for OpenMP and MPI jobs
--------------------------------

Single node jobs
++++++++++++++++

For applications that are not optimized for HPC (high performance computing) systems
like simple python or R scripts and a lot of software which is optimized for desktop PCs.

Simple applications and scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Many simple tools and scripts are not parallized at all and therefore won't profit from
more than one CPU core.

=============================   ============================================================================================================================
Parameter                       Function
=============================   ============================================================================================================================
``--nodes=1``                       Start a unparallized job on only one node
``--ntasks-per-node=1``             For OpenMP, only one task is necessary
``--mem=<MB>``                      Memory (RAM) for the job. Number followed by unit prefix, e.g. 16G
=============================   ============================================================================================================================

If you are unsure if your application can benefit from more cores try a higher number and
observe the load of your job. If it stays at approximately one there is no need to ask for more than one.


OpenMP applications
^^^^^^^^^^^^^^^^^^^
OpenMP (Open Multi-Processing) is a multiprocessing library is often used for programs on
shared memory systems. Shared memory describes systems which share the memory between all
processing units (CPU cores), so that each process can access all data on that system.

=================================   ============================================================================================================================
Parameter                            Function
=================================   ============================================================================================================================
``--nodes=1``                       Start a parallel job for a shared memory system on only one node
``--ntasks-per-node=1``             For OpenMP, only one task is necessary
``--cpus-per-task=<num_threads>``   Number of threads (CPU cores) to use
``--mem=<MB>``                      Memory (RAM) for the job. Number followed by unit prefix, e.g. 16G
=================================   ============================================================================================================================


Multiple node jobs (MPI)
+++++++++++++++++++++++++

For MPI applications.

Depending on the frequency and bandwidth demand of your setup, you can either just start a number of MPI tasks or request whole nodes.
While using whole nodes guarantees a lower latency and higher bandwidth it usually results in a longer queuing time compared to cluster wide job.
With the latter the SLURM manager can distribute your task across all nodes of Scicluster and
utilize otherwise unused cores on nodes which for example run a 6 core job on a 8 core node.
This usually results in shorter queuing times but slower inter-process connection speeds.

.. To be modified for scicluster

.. We strongly advice all users to ask for a given set of cores when submitting
.. multi-core jobs.  To make sure that you utilize full nodes, you should ask for
.. sets that adds up to both 16 and 20 (80, 160 etc) due to the hardware specifics
.. of Scicluster i.e. submit the job with ``--ntasks=80`` **if** your application
.. scales to this number of tasks.

.. This will make the best use of the resources and give the most predictable
.. execution times. If your job requires more than the default available memory per
.. core (32 GB/node gives 2 GB/core for 16 core nodes and 1.6GB/core for 20 core
.. nodes) you should adjust this need with the following command: ``#SBATCH
.. --mem-per-cpu=4GB`` When doing this, the batch system will automatically allocate
.. 8 cores or less per node.

To use whole nodes
^^^^^^^^^^^^^^^^^^

=================================   =============================================================================================================================
Parameter                           Function
=================================   =============================================================================================================================
``--nodes=<num_nodes>``             Start a parallel job for a distributed memory system on several nodes
``--ntasks-per-node=<num_procs>``   Number of (MPI) processes per node. Maximum number depends on node type
``--cpus-per-task=1``               Use one CPU core per task.
``--exclusive``                     Job will not share nodes with other running jobs. You don't need to specify memory as you will get all available on the node.
=================================   =============================================================================================================================


Cluster wide
^^^^^^^^^^^^^^^^^^^^^^

=============================   ============================================================================================================================
Parameter                       Function
=============================   ============================================================================================================================
``--ntasks=<num_procs>``            Number of (MPI) processes in total. Equals to the number of cores
``--mem-per-cpu=<MB>``              Memory (RAM) per requested CPU core. Number followed by unit prefix, e.g. 1G
=============================   ============================================================================================================================


Scalability
+++++++++++

You should run a few tests to see what is the best fit between minimizing
runtime and maximizing your allocated cpu-quota. That is you should not ask for
more cpus for a job than you really can utilize efficiently. Try to run your
job on 1, 2, 4, 8, 16, etc., cores to see when the runtime for your job starts
tailing off. When you start to see less than 30% improvement in runtime when
doubling the cpu-counts you should probably not go any further. Recommendations
to a few of the most used applications can be found in :ref:`sw_guides`.


Job related environment variables
---------------------------------

Here we list some environment variables that are defined when you run a job
script.  These is not a complete list. Please consult the SLURM documentation
for a complete list.

Job number::

  SLURM_JOBID
  SLURM_ARRAY_TASK_ID  # relevant when you are using job arrays

List of nodes used in a job::

  SLURM_NODELIST

Submit directory (this is the directory where you have sbatched your job)::

  SUBMITDIR
  SLURM_SUBMIT_DIR

Default number of threads::

  OMP_NUM_THREADS=1

Task count::

  SLURM_NTASKS



.. _label_partitions:

Partitions (queues)
--------------------------------

SLURM differs slightly from the previous Torque system with respect to
definitions of various parameters, and what was known as queues in Torque may
be covered by both ``--partition=...`` and ``--qos=...``.

We have the following partitions:

+-----------+---------+-------------+--------------+----------------------+
| Partition | MaxTime | DefaultTime | DefMemPerCPU | Max number of  Nodes |
+===========+=========+=============+==============+======================+
| short     | 1 day   | 30 min      | 512 MB       | 1                    |
+-----------+---------+-------------+--------------+----------------------+
| long      | 1 week  | 30 min      | 512 MB       | 1                    |
+-----------+---------+-------------+--------------+----------------------+
| PARA      | 1 week  | 30 min      | 512 MB       | 4                    |
+-----------+---------+-------------+--------------+----------------------+

To display a straight-forward summary: available partitions, their job size, status, timelimit and node information with A/I/O/T (allocated, idle, other, and total)::

  $ sinfo -o "%.10P %.15s %.10a %.10l %.15F"

Numbers represent field length and should be used to properly accommodate the data.

See :ref:`about_Scicluster` chapter of the documentation if you need more information on the system architecture.



.. _label_qos:

Quality of servisec (QOS)
--------------------------------

We have also defined three QOSs (quality of service) for better management: low, normal and high.

+--------+-----------------------------+---------------+
|   QOS  |      Max node per user      | Max wall time |
+--------+-----------------------------+---------------+
|   low  | 1 (this is the default QOS) |       7       |
+--------+-----------------------------+---------------+
| normal |              2              |       1       |
+--------+-----------------------------+---------------+
|  high  |              3              |       1       |
+--------+-----------------------------+---------------+

All members of the faculty of science have low and normal QOS which means they can use 
1 node for 7 days or 2 nodes for 1 day. Currently just for testing, all the members have also highQOS i.e.
they can use 3 nodes for 1 day. After about one month, this QOS will be assigned only to those of users
that report reasonable performance using 3 nodes. 

.. code-block:: bash

   ## for 3 nodes
   #SBATCH --qos=high
   #SBATCH --ntasks=80
   #SBATCH -w compute-0-[0,2,3]
   #SBATCH --time=1-00:00:00 # maximum time for "high" QOS is 1 day

   ## for 2 nodes (e.g. compute-0-0 and 0-3)
   #SBATCH --qos=normal
   #SBATCH --ntasks=56 ## 
   #SBATCH -w compute-0-[0,3] 
   #SBATCH --time=1-00:00:00 # maximum time for "normal" QOS is 1 day

   ## for 1 node (e.g. compute-0-1)
   #SBATCH --qos=low ## this is default, so you can ignore it
   #SBATCH --ntasks=16 ## 
   #SBATCH -w compute-0-1
   #SBATCH --time=7-00:00:00 # maximum time for "low" QOS is 7 days

Please note that currently compute-0-1 has NOT equipped with 10 G adapter, so for distributed MPI parallel jobs,
you can not use it.
