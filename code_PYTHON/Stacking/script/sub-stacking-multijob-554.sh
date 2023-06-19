#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64
source /public1/soft/modules/module.sh  
source /public1/soft/other/module.sh  
module load vasp/544-vtst+opt+sol+wannier


rm WAVECAR SUMMARY.fcc
for i in 0 0.125 0.25 0.375 0.5 0.625 0.875 1; 
do
     python pos-CrxTey.py $i

srun vasp_std

# E=`awk '/F=/ {print $0}' OSZICAR` ; echo $i $E  >>SUMMARY.fcc
   mkdir $i
   mv CHG CONTCAR EIGENVAL OSZICAR PCDAT vasprun.xml WAVECAR CHGCAR DOSCAR IBZKPT OUTCAR POSCAR XDATCAR $i

done