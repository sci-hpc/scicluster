#!/bin/bash -l

##########################
# example for an MPI job #
##########################

#SBATCH --job-name=example

# 12 MPI tasks in total
# sci-cluster-testing has 4 cores/node and therefore we take
# a number that is divisible by both
#SBATCH --ntasks=12

# run for five minutes
#              d-hh:mm:ss
#SBATCH --time=0-00:05:00

# 500MB memory per core
# this is a hard limit
#SBATCH --mem-per-cpu=500MB

# turn on all mail notification
#SBATCH --mail-type=ALL
#SBATCH --mail-user=username@um.ac.ir

# stdout
#SBATCH --output="stdout.txt"
# stderr
#SBATCH --error="stderr.txt"

# you may not place bash commands before the last SBATCH directive

# define and create a unique shared directory
SHARED_DIRECTORY=/home/work/${USER}/example/${SLURM_JOBID}
mkdir -p ${SHARED_DIRECTORY}
cd ${SHARED_DIRECTORY}

# we execute the job and time it
time mpirun -np $SLURM_NTASKS ./my_binary.x &> my_output

# happy end
exit 0
