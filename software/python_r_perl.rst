.. _python_r_perl:

*******************************
Python, R, Mathematica and Perl
*******************************

.. _python:

Python
=======
You can install many python and non-python packages yourself using
`conda <https://docs.conda.io/en/latest/>`_.

Conda enables you to easily install complex packages and software.
Creating multiple environments enables you to have installations of the
same software in different versions or incompatible software collections
at once.
You can easily share a list of the installed packages with
collaborators or colleagues, so they can setup the same
environment in a matter of minutes.

Setup
------
First we load the Anaconda3 module which is like a python package manager.
Conda makes it easy to have multiple environments for example one python2 and
one python3 based parallel to each other without interfering.

We first remove all loaded modules

::

  module purge

Then load the Anaconda3

::

  module load Anaconda3

To use all Anaconda pre-installed packages (base environment), we can run in an interactive job

.. code-block:: bash

  ml purge # ml here means module load
  ml Anaconda3
  source /home/modules/software/Anaconda3/2020.02/etc/profile.d/conda.sh

This should activate the base environment. We can add the above commands also in our job scripts. For example if we want to run jupyter notebook in a node for data analyzing, we can submit a job as

.. code-block:: bash

    #!/bin/bash
    #SBATCH -J jupyter
    #SBATCH --partition LONG
    #SBATCH --nodes=1
    #SBATCH --ntasks=1
    #SBATCH --nodelist=compute-0-1
    #SBATCH --output="stdout_jup.txt"
    #SBATCH --error="stderr_jup.txt"
    #SBATCH --mem-per-cpu=1000
    #SBATCH --time=7-0:0:0
    ulimit -s unlimited
    cd $SLURM_SUBMIT_DIR
    ml purge
    ml Anaconda3
    source /home/modules/software/Anaconda3/2020.02/etc/profile.d/conda.sh
    conda activate base

    jupyter notebook --no-browser >& out.txt

To install packages in another environment, we can first add the package repository to conda
(we only have to do this once) and set up a new conda environment which we
will call e.g. "py3" where we also specify which python version we want
and which packages should be installed, e.g. matplotlib and numpy

.. code-block:: bash

  conda config --add channels defaults
  conda config --add channels conda-forge

  conda create --name py3 python=3 matplotlib numpy
  
If we want to install the conda environment in another directory than our
home, we can add `--prefix PATH`. This enables multiple users of a project to
share the conda environment by installing it into their project folder instead
of the users home

.. code-block:: bash

  conda create --prefix /work8/your_username/envs --name py3 python=3 matplotlib numpy

Daily usage
-------------
To load this environment we have to use the following commands either on the
command line (by assigning an interactive job) or in our job script::

  ml purge
  ml Anaconda3
  conda activate py3

Then we can use all software as usual.

To deactivate the current environment::

  conda deactivate

If we need to install additional software or packages,
we can search for it with::

  conda search SOMESOFTWARE

and install it with::

  conda install -n py3 SOMESOFTWARE
  
If the python package you are looking for is not available in conda
you can use `**pip** <https://pip.pypa.io/en/stable/>`_ like usually
from within a conda environment to install additional python packages::

  pip install package_name

To update the a single package with conda::

  conda update -n py3 package_name

or to update all packages::

  conda update -n py3 --all
  
Share your environment
-------------------------
To export a list of all packages/programs installed with conda 
in a certain environment (in this case "py3")::

  conda list --explicit --name py3 > package-list.txt
  
To setup a new environment (let's call it "newproj")
from an exported package list::

  conda create --name newproj --file package-list.txt

For more details, please see the offical `conda manual <https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>`_.

R
=======

TBA

Mathematica
===========

TBA

Perl
======

TBA
