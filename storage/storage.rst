
Storage
==================

Available file system
---------------------

Scicluster currently has four special storage file systems:

* Network shared (NFS) home area:            /home        (RAID 1, ~ 620 GB, NAS aware SATA3 disks)
* Network shared (NFS) work1 area:           /work1 (1 TB SATA3 general disk)
* Network shared (NFS) work8 area:           /work8 (8 TB SATA3 data center special disk)
* Local scratch area on each node:           /state/partition1  (soft linked to /scratch1) (1.2 TB SAS disks)

Home area
---------

This file system is for user home directories on Scicluster. It is not on a seperate hard disk, so please do not use it for big files at all. /home/your_username is accessible from both the frontend and all the compute
nodes. If you need more space, consider using /work{1,8} (see below).

The home area is for "permanent" storage only, so please do not use it for
temporary storage during production runs at all. Jobs using the home area for scratch
files while running may be killed without any warning.

/Work1 area
------------------

This file system could be used for archiving data, because it is not suitable for writing data produced by running jobs. This file system is accessible from both the frontend and all the compute nodes at /work1. The current quotas for each user on /work1 are: 42 GB soft limit and 44 GB hard limit. 

/Work8 area
------------------

This file system could be used for writing the output of MPI parallel jobs that run on more than one node. It could also be used for saving your date that are written on local scratch (see below) spaces in each node. The current quotas for each user on /work8 are: 375 GB soft limit and 380 GB hard limit.


Scratch areas
------------------

* In addition, each compute node has a scratch area of 1.2 TB, only locally accessible on each node. This is the area which should be used for serial jobs or parallel jobs that run on just one node. The space is currently accessible as
  /state/partition1 or /scratch1 on each compute node. Scratch spaces are very **high speed** and consist of SAS 10k and 15k disks. Please note that there is no quota limit but all data will be **removed** automatically after **two weeks**.

