#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64
source /public1/soft/modules/module.sh  
source /public1/soft/other/module.sh  
module load vasp/544-vtst+opt+sol+wannier


rm WAVECAR SUMMARY.fcc
for i in 0.311605 0.623210 0.934815 1.246420 1.558025 1.869630 2.181235 2.492840 2.804445 3.116050; 
do
     python pos-strain-bi.py $i

srun vasp_std

# E=`awk '/F=/ {print $0}' OSZICAR` ; echo $i $E  >>SUMMARY.fcc
   mkdir $i
   mv CHG CONTCAR EIGENVAL OSZICAR PCDAT vasprun.xml WAVECAR CHGCAR DOSCAR IBZKPT OUTCAR POSCAR XDATCAR $i

done