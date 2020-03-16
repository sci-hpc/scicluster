#!/bin/bash -l

#######################################
# example for a hybrid MPI OpenMP job #
#######################################

#SBATCH --job-name=example

# we ask for 2 MPI tasks with 4 cores each
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=4

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

# we set OMP_NUM_THREADS to the number cpu cores per MPI task
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# we execute the job and time it
time mpirun -np $SLURM_NTASKS ./my_binary.x &> my_output

# happy end
exit 0
