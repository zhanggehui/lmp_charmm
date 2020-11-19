#!/bin/bash
#SBATCH -J lmp
#SBATCH -p cn-short
#SBATCH -N 4
#SBATCH --qos=liufengcns
#SBATCH --ntasks-per-node=20
#SBATCH -o 1.out
#SBATCH -e 2.err
#SBATCH --no-requeue
#SBATCH -A liufeng_g1
#SBATCH --exclusive

hosts=`scontrol show hostname $SLURM_JOB_NODELIST`; echo $hosts
partion=`scontrol show partition`
echo ${partion}

currentdir=`pwd` 
cd /home/liufeng_pkuhpc/lustre2/zgh/zgh_lmp/lmp_install/ ; gitget ; cd $currentdir
source /home/liufeng_pkuhpc/lustre2/zgh/zgh_lmp/lmp_install/lammps_29Oct2020.sh ${partion}

mpirun -np $SLURM_NTASKS lmp -in step4.2_annealing.inp