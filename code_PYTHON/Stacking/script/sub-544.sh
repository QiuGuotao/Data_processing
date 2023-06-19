#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64
source /public1/soft/modules/module.sh  
source /public1/soft/other/module.sh  
module load vasp/544-vtst+opt+sol+wannier
srun vasp_std
