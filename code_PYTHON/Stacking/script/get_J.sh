#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64


srun wann2J.py --spinor --groupby spin --posfile POSCAR --efermi 5.2049 --kmesh 3 3 3 --elements Cr --prefix_spinor wannier90
