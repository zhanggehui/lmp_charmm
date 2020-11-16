#!/bin/bash
#SBATCH -J lmp
#SBATCH -p cn-long
#SBATCH -N 3
#SBATCH -o 1.out
#SBATCH -e 2.err
#SBATCH --no-requeue
#SBATCH -A liufeng_g1
#SBATCH --qos=liufengcnl
#SBATCH --ntasks-per-node=20
#SBATCH --exclusive

hosts=`scontrol show hostname $SLURM_JOB_NODELIST`; echo $hosts
echo $1
source /appsnew/source/intel2018.sh
#export PATH=/appsnew/physapps/lammps/lammps-7Aug192/bin/bin/:$PATH  # 1,2
#export PATH=/appsnew/physapps/lammps/lammps-7Aug19/bin/bin/:$PATH  # 1,3
#source /appsnew/source/lammps-7Aug19-intel2018mpi-add.sh
#export PATH=/appsnew/physapps/lammps/lammps-7Aug192/bin2/bin:$PATH

mpirun -np $SLURM_NTASKS lmp -in step4.0_minimization.inp