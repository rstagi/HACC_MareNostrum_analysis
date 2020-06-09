#!/bin/bash

echo "Starting weak analysis using OpenMP."

if [ -z "$EXTRAE_HOME" ]; then
	echo "Environment hasn't been set yet. Initializing it now..."
	source ~/environment.sh
else
	echo "Environment has been set and it's ready."
fi

echo "Start running the jobs"

export EX_DIR=$(pwd)/ex
export BASE_NAME=HACC
export NAME_DESC=omp_strong
export WORK_DIR_BASE=$(pwd)/results/${NAME_DESC}/
export QOS=debug
export INPUT_FILE=$(pwd)/indat/${NAME_DESC}/indat
export NTASKS=64
export GRID=4x4x4
export TIME=00:59:59

OMP_NUM_THREADS=1  ./sbatch_hacc.sh
OMP_NUM_THREADS=2  ./sbatch_hacc.sh
OMP_NUM_THREADS=4  ./sbatch_hacc.sh
OMP_NUM_THREADS=8  ./sbatch_hacc.sh
OMP_NUM_THREADS=16 ./sbatch_hacc.sh
