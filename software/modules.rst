.. _module_scheme:

Software Module Scheme
=======================

Since a HPC cluster is shared among many users, and also holds a significant size in contrast to most desktop compute machinery around, the amount of installed software spans many applications in many different versions and quite a few of them are installed typically non-standard places for easier maintenance (for admin crew), practical and security reasons. It is not possible (nor
desirable) to use them all at the same time, since different versions of the
same application may conflict with each other. Therefore, it is practical to provide the production environment for a given application outside of the application itself. This is done using a set of instructions and variable settings that are specific for the given application called an application module. This also simplifies control of which application versions are available in a specific session.


The main command for using this system is the *module* command. You can find a
list of all its options by typing::

  module --help

We use the lmod module system; for more info see https://lmod.readthedocs.io/en/latest/ on Stallo. Below we listed the most commonly used options, but also feel free to ivestigate options in this toolset more thoroughly on developers site.


Which modules are currently loaded?
-----------------------------------

To see the modules currently active in your session, use the
command::

  module list

 
Which modules are available?
----------------------------

In order to see a complete list of available modules, issue the
command::

  module av


How to load a module
--------------------

In order to make, for instance, the openmpi available, issue the command::

  module load rocks-openmpi

This will load the default openmpi version 2.1.1.
 

How to unload a module
----------------------
::

  module unload rocks-openmpi


