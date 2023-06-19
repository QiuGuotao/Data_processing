#!/bin/bash
#SBATCH -p amd_256
#SBATCH -N 1
#SBATCH -n 64
source /public1/soft/modules/module.sh  
source /public1/soft/other/module.sh  
module load vasp/544-vtst+opt+sol+wannier



for s in $(ls)  #所有在当前目录的文件
do ([ -d $s ] && cd $s; srun vasp_std)  #小括号意思执行完文件回到当前文件夹，-d判断s是不是文件夹
done
