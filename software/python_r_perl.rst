.. _python_r_perl:

***************************
Python and Perl
***************************
Scripting languages often support modules or libraries for additional functionality or convenience functions. We encourage users to install modules locally for only the current user.


.. _python:

Python
=======
You can install many python and non-python packages yourself using 
`conda <https://docs.conda.io/en/latest/>`_.

Conda enables you to easily install complex packages and software.
Creating multiple enviroments enables you to have installations of the 
same software in different versions or incompatible software collections
at once.
You can easily share a list of the installed packages with 
collaborators or colleagues, so they can setup the same
eniviroment in a matter of minutes.

Setup
------
First you load the anaconda3 module which is like a python package manager.
Conda makes it easy to have multiple environments for example one python2 and
one python3 based parallel to each other without interfering.

Start by removing all preloaded modules which can complicate things. We then
display all installed version and load the version 2019.10::

  module purge
  module load anaconda3


Perl
======

TBA
