
Storage
==================

Available file system
---------------------

Sci-cluster-testing has a "three folded" file system:

* Global accessible home area (user area):            /home        (Fast SSD but very limitted ~ 10 GB)
* Global accessible work or scratch area:             /home/work (soft linked to /work) (1 TB SATA3)
* Local accessible work or scratch area on each node: /state/partition1  (soft linked to /scratch1) (1 TB SATA)

Home area
---------

This file system is for user home directories on Sci-cluster-testing. It is not on a seperate hard disk, so please do not use it for big files at all. /home/your_username is accessible from both the frontend and all the compute
nodes. If you need more space, consider using /work (see below).

The home area is for "permanent" storage only, so please do not use it for
temporary storage during production runs. Jobs using the home area for scratch
files while running may be killed without any warning.

Work/scratch areas
------------------

There are two different work/scratch areas available on Sci-cluster-testing:

* 1 TB global accessible work area on the cluster,
  accessible from both the frontend and all the compute nodes as /home/work or /work. 
* In addition, each compute node has a scratch area of 1 TB, only locally accessible on each node. This area is currently accessible as
  /state/partition1 or /scratch1 on each compute node.

