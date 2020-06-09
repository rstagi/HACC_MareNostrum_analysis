#!/bin/bash

echo "Starting strong analysis on large input."

if [ -z "$EXTRAE_HOME" ]; then
	echo "Environment hasn't been set yet. Initializing it now..."
	source ~/environment.sh
else
	echo "Environment has been set and it's ready."
fi

echo "Start running the jobs"

export EX_DIR=$(pwd)/ex
export BASE_NAME=HACC
export NAME_DESC=strong_largeIN
export WORK_DIR_BASE=$(pwd)/results/strong/large/
export QOS=debug
export INPUT_FILE=$(pwd)/indat/strong/indat_large
export OMP_NUM_THREADS=1

NTASKS=1   TIME=01:59:59 GRID=1x1x1 ./sbatch_hacc.sh
NTASKS=2   TIME=01:59:59 GRID=2x1x1 ./sbatch_hacc.sh
NTASKS=4   TIME=01:59:59 GRID=2x2x1 ./sbatch_hacc.sh
NTASKS=8   TIME=01:59:59 GRID=2x2x2 ./sbatch_hacc.sh
NTASKS=16  TIME=01:59:59 GRID=4x2x2 ./sbatch_hacc.sh
NTASKS=32  TIME=01:29:59 GRID=4x4x2 ./sbatch_hacc.sh
NTASKS=64  TIME=01:29:59 GRID=4x4x4 ./sbatch_hacc.sh
NTASKS=128 TIME=00:59:59 GRID=8x4x4 ./sbatch_hacc.sh
NTASKS=256 TIME=00:59:59 GRID=8x8x4 ./sbatch_hacc.sh
NTASKS=512 TIME=00:29:59 GRID=8x8x8 ./sbatch_hacc.sh
