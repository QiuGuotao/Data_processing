#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64
source /public1/soft/modules/module.sh
module load gcc/9.1.0
export PATH=/public1/home/sc90509/povray-install/bin:${PATH}
export LD_LIBRARY_PATH=/public1/home/sc90509/soft/tiff-4.0.9/install/lib:$LD_LIBRARY_PATH
srun povray 
