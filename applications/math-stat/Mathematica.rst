.. _Mathematica:

======================================
Mathematica
======================================


General Information
===================

Description
-----------

Wolfram Mathematica is a modern technical computing system spanning most areas of technical computing — including neural networks, machine learning, image processing, geometry, data science, visualizations, and others. The system is used in many technical, scientific, engineering, mathematical and computing fields.


Online info
-----------------------

* Homepage: https://www.wolfram.com/mathematica/
* Documentation: https://reference.wolfram.com/language/?source=nav


Mathematica on Scicluster:
==============================================

Request an Interactive Job with X11 forwarding
----------------------------------------------

Login to the frontend::

  ssh -Y username@172.21.127.53

To run Mathematica interactively, you need to request an interactive session on a compute node. See :doc:`/jobs/interactive`.

After requesting an interactive job for example on `compute-0-3` node, run in **another** terminal::

  ssh -Y compute-0-3

Usage
-----

To launch Mathematica in your above mentioned terminal, you will first need to make sure you have the correct module loaded. You can search for all available Mathematica versions::

  module avail Mathematica

Load the appropriate module file. For example, to run version 12.3::

  module load Mathematica/12.3.0

Once you have the appropriate module loaded in an interactive job, start Mathematica. The `&` will put the program in the background so you can continue to use your terminal session::

  Mathematica &



