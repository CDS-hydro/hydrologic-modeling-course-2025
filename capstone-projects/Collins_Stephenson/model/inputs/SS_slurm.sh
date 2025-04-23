#!/bin/bash -l
#SBATCH --account=owner-guest
#SBATCH --partition=notchpeak-shared-guest
#SBATCH --qos=notchpeak-guest
#SBATCH --nodes=1 #specify number of nodes
#SBATCH --ntask=32 #specify number of CPUs
#SBATCH --time=06:00:00 #specify time limit in HH:MM:SS
#SBATCH -o slurm-%N-%j.out #standard output in the form slurmjob-<JOBID>.out-<NODEID>
#SBATCH -e slurm-%N-%j.err #standard error messages in the form slurmjob-<JOBID>.err-<NODEID>
#SBATCH --job-name=HM_steady_state #specify job name
#SBATCH --mail-type ALL #receive all notification
#SBATCH --mail-user collins.stephenson@usu.edu #email used to receive notifications
#SBATCH --constraint=<CONSTRAINTS> #specify other constraints: memory, owner node name, etc


#load ats from modulefile
module use -a /uufs/chpc.utah.edu/common/home/shuai-group1/modulefiles
module load pflotran/notchpeak/6.0/v6.0

#change into run directory
cd /scratch/hydrologic-modeling-course-2025/capstone-projects/Collins_Stephenson/model/outputs

#launch ats. Make sure xml file can be found.
mpirun -np 32 pflotran -pflotranin ../inputs/2D_flow-steady-state.in
