#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64
source /public1/soft/modules/module.sh  
source /public1/soft/other/module.sh  
module load vasp/544-vtst+opt+sol+wannier


rm WAVECAR SUMMARY.fcc
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36; 
do
     python fourstate_incar.py $i

srun vasp_ncl

   E=`awk '/F=/ {print $0}' OSZICAR` ; echo $i $E  >>SUMMARY.fcc
   mkdir $i
   mv INCAR CONTCAR EIGENVAL OSZICAR PCDAT vasprun.xml DOSCAR IBZKPT OUTCAR XDATCAR $i

done