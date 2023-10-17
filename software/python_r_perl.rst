.. _python_r_perl:

*******************************
Python and R
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

.. _setup:

Setup
------
First load the Anaconda3 module which is like a python package manager.
Conda makes it easy to have multiple environments for example one python2 and
one python3 based parallel to each other without interfering.

We first remove all the loaded modules

.. code-block:: bash

  module purge

Then load the Anaconda3

.. code-block:: bash

  module load Anaconda3

To use all Anaconda pre-installed packages (base environment), we can run in an interactive job

.. code-block:: bash

  ml purge # ml here means module load
  ml Anaconda3
  source /home/modules/software/Anaconda3/2020.02/etc/profile.d/conda.sh
  conda activate base

This should activate the `base` environment. But it's recommended to create a separate environment for each of our projects (please note that anaconda might not be accessible directly in Iran and the following command might not work). So instead of the last command, we can do

.. code-block:: bash

  conda create --name myproject python=3.7

(If you see ``CondaValueError: The target prefix is the base prefix. Aborting.``, you forgot ``--name``). Then we can activate it 

.. code-block:: bash

  conda activate myproject

and install the needed packages

.. code-block:: bash

  conda install your_package
  
If we want to install the conda environment in another directory than our
home, we can add `--prefix PATH`. This enables multiple users of a project to
share the conda environment by installing it into their project folder instead
of the users home

.. code-block:: bash

  conda create --prefix /work8/your_username/envs/myproject python=3 matplotlib numpy
  

Daily usage
-------------
To load this environment we have to use the following commands either on the
command line (by assigning an interactive job) or in our job script::

  ml purge
  ml Anaconda3
  conda activate myproject

Then we can use all software as usual.

To deactivate the current environment::

  conda deactivate

If we need to install additional software or packages,
we can search for it with::

  conda search SOMESOFTWARE

and install it with::

  conda install -n myproject SOMESOFTWARE
  
If the python package we are looking for is not available in conda
we can use `pip <https://pip.pypa.io/en/stable/>`_ usually
from within a conda environment to install additional python packages::

  pip install package_name

To update the a single package with conda::

  conda update -n myproject package_name

or to update all packages::

  conda update -n myproject --all
  
Share your environment
-------------------------
To export a list of all packages/programs installed with conda 
in a certain environment (in this case "myproject")::

  conda list --explicit --name myproject > package-list.txt
  
To setup a new environment (let's call it "newproj")
from an exported package list::

  conda create --name newproj --file package-list.txt

For more details, please see the offical `conda manual <https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>`_.

Using python in interactive jobs
------------------------------------
When we want to use python interactively for a time longer than just a short test, we should submit an :ref:`interactive`. Before running our code, we should :ref:`setup` the environment as explained above.

Using jupyter notebook
----------------------
To use `jupyter <https://jupyter.org/>`_ notebook submit an interactive job and setup your environment, then in a node that is assigned to us (e.g. compute-0-0), we run

.. code-block:: bash

  jupyter notebook --no-browser --port=8888

This will start jupyter and print some information (including an address where the jupyter is running at)

Then in the forntend we run

.. code-block:: bash

  ssh -NL 8888:localhost:8888 compute-0-0

and in our computer (one that we used to connect to the frontend) run

.. code-block:: bash

  ssh -NL 8888:localhost:8888 your_username@login-node

Finally we go to the address where the jupyter is running in our web browser, e.g.

.. code-block:: bash

  http://localhost:8888/?token=14ba92d6b0529c3d748b03e31542f988ee3d10b147b7c3f0

Using python for long time jobs
-------------------------------

For longer usage it will be better to submit a batch script. This could be like

.. code-block:: bash

    #!/bin/bash
    #SBATCH -J jupyter
    #SBATCH --partition long
    #SBATCH --nodes=1
    #SBATCH --ntasks=1
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

    python ./your_python_script.py >& out    
    
or for using jupyter, replace the last line with

.. code-block:: bash

    jupyter notebook --no-browser --port=8888 >& out

and repeat the ssh tunneling as explained above.

R
=======

TBA
