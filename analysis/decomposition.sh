#!/bin/bash

echo "Starting decomposition analysis"

if [ ! -z "$(module list fftw 2>&1> /dev/null | grep 'None found')" ] || [ ! -z "$(module list BSCTOOLS 2>&1> /dev/null | grep 'None found')" ] || [ ! -z "$(module list openmp 2>&1> /dev/null | grep 'None found')" ]; then

        echo "Environment hasn't been set yet. Initializing it now..."
        source $(pwd)/environment/run_env.bash
else
        echo "Environment has been set and it's ready."
fi

echo "Start running the jobs"

export EX_DIR=$(pwd)/ex
export BASE_NAME=HACC
export NAME_DESC=decomposition
export WORK_DIR_BASE=$(pwd)/results/${NAME_DESC}/
export QOS=debug
export INPUT_FILE=$(pwd)/indat/${NAME_DESC}/indat
export OMP_NUM_THREADS=1

NTASKS=64  TIME=01:59:59 GRID=64x1x1 ./sbatch_hacc.sh
NTASKS=64  TIME=01:59:59 GRID=32x2x1 ./sbatch_hacc.sh
NTASKS=64  TIME=01:59:59 GRID=16x2x2 ./sbatch_hacc.sh
NTASKS=64  TIME=01:29:59 GRID=8x4x2 ./sbatch_hacc.sh
NTASKS=64  TIME=01:29:59 GRID=4x4x4 ./sbatch_hacc.sh
