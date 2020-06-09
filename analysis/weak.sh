#!/bin/bash

echo "Starting weak scaling analysis."

if [ ! -z "$(module list fftw 2>&1> /dev/null | grep 'None found')" ] || [ ! -z "$(module list BSCTOOLS 2>&1> /dev/null | grep 'None found')" ] || [ ! -z "$(module list openmp 2>&1> /dev/null | grep 'None found')" ]; then

        echo "Environment hasn't been set yet. Initializing it now..."
        source $(pwd)/environment/run_env.bash
else
        echo "Environment has been set and it's ready."
fi


echo "Start running the jobs"

export EX_DIR=$(pwd)/ex
export BASE_NAME=HACC
export NAME_DESC=weak
export WORK_DIR_BASE=$(pwd)/results/${NAME_DESC}/
export QOS=debug
export INPUT_FILE_BASE=$(pwd)/indat/${NAME_DESC}/indat
export OMP_NUM_THREADS=1

NTASKS=1   TIME=01:59:59 GRID=1x1x1 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=2   TIME=01:59:59 GRID=2x1x1 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=4   TIME=01:59:59 GRID=2x2x1 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=8   TIME=01:59:59 GRID=2x2x2 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=16  TIME=01:59:59 GRID=4x2x2 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=32  TIME=01:29:59 GRID=4x4x2 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=64  TIME=01:29:59 GRID=4x4x4 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=128 TIME=00:59:59 GRID=8x4x4 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=256 TIME=00:59:59 GRID=8x8x4 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
NTASKS=512 TIME=00:29:59 GRID=8x8x8 INPUT_FILE=${INPUT_FILE_BASE}_${NTASKS}x ./sbatch_hacc.sh
