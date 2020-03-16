.. _about_sci-cluster-testing:

============
About Sci-cluster-testing
============


Resource description
====================

Key numbers about the Stallo cluster: compute nodes, node interconnect,
operating system, and storage configuration.



+-------------+-----------------+---------------------+---------+------------+-------+-----------------------------+
|             | CPU             | architecture        | # core  |  # thread  | RAM   | storage                     |
+-------------+-----------------+---------------------+---------+------------+-------+-----------------------------+
| Head Node   | Core i7-6700k   | Skylake (2015)      | 4       | 8          | 32 GB | 128 GB SSD, 1 TB /home/work |
+-------------+-----------------+---------------------+---------+------------+-------+-----------------------------+
| compute-0-0 | Core 2Duo-E7500 | Wolfdale (2008)     | 2       | 2          | 4 GB  | 300 GB                      |
+-------------+-----------------+---------------------+---------+------------+-------+-----------------------------+
| compute-0-1 | Core i7-2600    | Sandy Bridge (2011) | 4       | 8          | 16 GB | 3 * 1 TB                    |
+-------------+-----------------+---------------------+---------+------------+-------+-----------------------------+
| compute-0-2 | Core i7-2600    | Sandy Bridge (2011) | 4       | 8          | 16 GB | 3 * 1 TB                    |
+-------------+-----------------+---------------------+---------+------------+-------+-----------------------------+
| compute-0-3 | Core i7-2600    | Sandy Bridge (2011) | 4       | 8          | 16 GB | 3 * 1 TB                    |
+-------------+-----------------+---------------------+---------+------------+-------+-----------------------------+


All nodes in the cluster are connected with Ethernet.

 
.. _linux-cluster:

Sci-cluster-testing - a Linux cluster 
========================

This is just a quick and brief introduction to the general features of Linux Clusters.

A Linux Cluster - one machine, consisting of many machines
----------------------------------------------------------

On one hand you can look at large Linux Clusters as rather large and powerful supercomputers, but on the other hand you can look at them as just a large bunch of servers and some storage system(s) connected with each other through a (high speed) network. Both of these views are fully correct, and it's therefore important to be aware of the strengths and the limitations of such a system.

On a Linux Cluster the picture is quite different. The system consists of several independent compute nodes (servers) connected with each other through some (high speed) network and maybe hooked up on some storage system. So the HW resources (like CPU, memory, disk, etc) in a cluster are in general distributed and only locally accessible at each server.


Linux operating system (Rocks): `<http://www.rocksclusters.org/>`_
==================================================================

Rocks is an open-source Linux cluster distribution that enables end users to easily build computational clusters, grid endpoints and visualization tiled-display walls. Hundreds of researchers from around the world have used Rocks to deploy their own cluster
