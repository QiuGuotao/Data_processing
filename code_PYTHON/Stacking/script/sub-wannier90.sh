#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64
source /public1/soft/modules/module.sh
module load wannier90/intel/3.1.0-ztt
srun wannier90.x wannier90
