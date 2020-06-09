#!/bin/bash

echo "Starting TEST job"

if [ test -n "$(module list fftw 2>&1> /dev/null | grep \"None found\")"
	|| test -n "$(module list BSCTOOLS 2>&1> /dev/null | grep \"None found\")" 
	|| test -n "$(module list openmp 2>&1> /dev/null | grep \"None found\")" ]; then
	
	echo "Environment hasn't been set yet. Initializing it now..."
	source $(pwd)/environment/run_env.sh
else
	echo "Environment has been set and it's ready."
fi

export OMP_NUM_THREADS=1
export EX_DIR=$(pwd)/ex
export BASE_NAME=HACC
export NAME_DESC=TEST
export WORK_DIR_BASE=$(pwd)/results/test_run/
export QOS=debug
export INPUT_FILE=$(pwd)/indat/test_input/indat_small

NTASKS=8   TIME=00:29:59 GRID=2x2x2 ./sbatch_hacc.sh
