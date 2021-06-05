.. _about_scicluster:

============
About Scicluster
============

 
.. _linux-cluster:


A Linux Cluster - one machine, consisting of many machines
----------------------------------------------------------

On one hand you can look at large Linux Clusters as rather large and powerful supercomputers,
but on the other hand you can look at them as just a large bunch of servers and some storage system(s)
connected with each other through a (high speed) network.
Both of these views are fully correct, and it's therefore important to be aware of the strengths and the limitations of such a system.



Rocks Gnu/Linux operating system
==================================================================


Scicluster is build upon `Rocks <http://www.rocksclusters.org/>`_ cluster distrobution.
Rocks is an open-source Linux cluster distribution that enables end users to easily build computational clusters,
grid endpoints and visualization tiled-display walls.
Hundreds of researchers from around the world have used Rocks to deploy their own cluster

Resource description
====================

Key numbers about the Scicluster: compute nodes, node interconnect,
operating system, and storage configuration.



+---------------------+------------------+------------------------+----------+----------+-------------+
| Model               | CPU/GPU          | architecture           | # cores  | RAM (GB) | Name        |
+---------------------+------------------+------------------------+----------+----------+-------------+
| sci (the head node) | 2 x Xeon E5-2420 | Ivy Bridge EN (2012)   | 12       | 16       | Supermicro  |
+---------------------+------------------+------------------------+----------+----------+-------------+
|                     | 2 x Xeon E5-2630 | Broadwell (2014)       | 20       | 64       |             |
+ compute-0-0         +                  +                        +          +          + ML350-Gen9  +
|                     | Quadro P4000     | Pascal (2016)          | 1792     | 8        |             |
+---------------------+------------------+------------------------+----------+----------+-------------+
| compute-0-1         | 2 x Xeon E5-2650 | Sandy Bridge EP (2011) | 16       | 32       | DL380p-Gen8 |
+---------------------+------------------+------------------------+----------+----------+-------------+
| compute-0-2         | 2 x Xeon E5-2690 | Haswell (2013)         | 24       | 256      | DL380-Gen9  |
+---------------------+------------------+------------------------+----------+----------+-------------+
|                     | 2 x Xeon E5-2695 | Broadwell (2014)       | 36       | 64       |             |
+ compute-0-3         +                  +                        +          +          + DL380-Gen9  +
|                     | Tesla K80        | Kepler (2014)          | 4992     | 24       |             |
+---------------------+------------------+------------------------+----------+----------+-------------+


Currently all nodes in the cluster are connected with a 1 Gb ethernet network as well as a 10 Gb low latency one for message passing.
