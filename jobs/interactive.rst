.. _interactive:

Interactive jobs
================

Starting an interacitve job
---------------------------
You can run an interactive job like this::

  $ srun -p SHORT --nodes=1 --ntasks-per-node=1 --time=01:00:00 --pty bash -i

Here we ask for a single core on one interactive node for one hour with the
default amount of memory. The command prompt will appear as soon as
the job starts.

Exit the bash shell to end the job. If you exceed the time or memory
limits the job will also abort.

Interactive jobs have the same policies as normal batch jobs, there
are no extra restrictions. You should be aware that you might be
sharing the node with other users, so play nice.

Keeping interactive jobs alive
------------------------------
Interactive jobs die when you disconnect from the frontend node either by choice or by
internet connection problems.

``interactive`` command
-----------------------

To ease running an interacitve job, we define a command wich you can find its help as ``interacitve -h``.
As an example do::

   $ interactive -c1 -w compute-0-0 -p SHORT


