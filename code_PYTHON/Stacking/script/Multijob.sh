#!/bin/bash -l

#SBATCH --job-name              fm-H
#SBATCH --partition             mpi-short
#SBATCH --nodes                 1
#SBATCH --tasks-per-node        40
#SBATCH --time                  24:00:00
#SBATCH --mem                   30G
#SBATCH --output                testkill.%j.out
#SBATCH --error                 testkill.%j.err

# asks SLURM to send the USR1 signal 120 seconds before end of the time limit
#SBATCH --signal=B:USR1@120

source /etc/profile
source /etc/profile.d/modules.sh


# define the handler function
# note that this is not executed here, but rather
# when the associated signal is sent
your_cleanup_function()
{
    echo "function your_cleanup_function called at $(date)"
    # do whatever cleanup you want here
    pkill -u yongqingcai
}

# call your_cleanup_function once we receive USR1 signal
trap 'your_cleanup_function' USR1

# your vasp program goes below

rm WAVECAR SUMMARY.fcc
for i in 1.02 1.03 1.04 1.06 1.07 1.08; 
do
     python pos.py $i

module add intel/18
module add impi/18
ulimit -s unlimited
 
NP=$(($SLURM_NTASKS_PER_NODE * $SLURM_JOB_NUM_NODES))
cd $SLURM_SUBMIT_DIR
mpirun -np $NP ~/bin/vasp_6.1.1_intel19/bin/vasp_std # vasp_gam

# E=`awk '/F=/ {print $0}' OSZICAR` ; echo $i $E  >>SUMMARY.fcc
   mkdir $i
   mv CHG CONTCAR EIGENVAL OSZICAR PCDAT vasprun.xml WAVECAR CHGCAR DOSCAR IBZKPT OUTCAR POSCAR XDATCAR $i

done
