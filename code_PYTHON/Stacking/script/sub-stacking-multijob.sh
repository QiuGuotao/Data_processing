#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64
source /public1/soft/modules/module.sh
module load hdf5/1.8.13-icc17
export LD_LIBRARY_PATH=/public1/home/sc90509/software-sc90509/a/hdf5-install/lib:$LD_LIBRARY_PATH
#export PATH=/public1/home/sc90509/software-sc90509/vasp.6.3.0-b/bin:$PATH
export PATH=/public1/home/sc90509/software-sc90509/a/vasp-master-release.6.3/bin:$PATH


rm WAVECAR SUMMARY.fcc
for i in 0 0.125 0.25 0.375 0.5 0.625 0.875 1; 
do
     python pos-CrxTey.py $i

mpirun -np 64 vasp_std

# E=`awk '/F=/ {print $0}' OSZICAR` ; echo $i $E  >>SUMMARY.fcc
   mkdir $i
   mv CHG CONTCAR EIGENVAL OSZICAR PCDAT vasprun.xml WAVECAR CHGCAR DOSCAR IBZKPT OUTCAR POSCAR XDATCAR $i

done