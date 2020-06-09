#!/bin/bash

#SBATCH --output=./output/%j.out
#SBATCH --error=./output/%j.err

##SBATCH --job-name="hacc1x_strong_1x1x1"
##SBATCH --workdir=./results/1x/
##SBATCH --ntasks=1
##SBATCH --time=01:59:00
##SBATCH --qos=debug

EX_DIR=${1}
INPUT_FILE=${2}
GRID=${3}

export BG_SHAREDMEMSIZE=32
export L1P_POLICY=std

#export OMP_NUM_THREADS=1                                                      
export BG_THREADLAYOUT=1   # 1 - default next core first; 2 - my core first    


export BG_MAPPING=ABCDET
export FAST_WAKEUP=TRUE
export VPROF_PROFILE=yes
export PAMID_COLLECTIVES=1
export XLSMPOPTS=stack=4000000


srun ${EX_DIR}/trace.sh ${EX_DIR}/hacc_tpm ${INPUT_FILE} ${EX_DIR}/cmbM000.tf m000 INIT ALL_TO_ALL -w -R -N 512 -a ${EX_DIR}/final -f ${EX_DIR}/refresh -m -t ${GRID}

rm -rf set-* TRACE.*
