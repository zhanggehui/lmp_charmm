#!/bin/bash
#SBATCH -J lmp
#SBATCH -p cn_nl
#SBATCH -N 1
#SBATCH --qos=liufengcnnl
#SBATCH --ntasks-per-node=28
#SBATCH -o 1.out
#SBATCH -e 2.err
#SBATCH --no-requeue
#SBATCH -A liufeng_g1
#SBATCH --exclusive

hosts=`scontrol show hostname $SLURM_JOB_NODELIST`; echo $hosts

source /home/liufeng_pkuhpc/lustre2/zgh/zgh_lmp/lmp_install/lammps_29Oct2020.sh

mpirun -np $SLURM_NTASKS lmp -in step4.2_annealing.inp