#!/bin/bash

WORK_DIR=${WORK_DIR_BASE}/${NTASKS}x_${OMP_NUM_THREADS}x_${GRID}
mkdir -p ${WORK_DIR}/output

echo ""
echo "Launching job of type ${NAME_DESC} with ${NTASKS} processes, ${OMP_NUM_THREADS} threads and ${GRID} as decomposition."
echo " input = ${INPUT_FILE}"
echo " working directory = ${WORK_DIR}"
sbatch  --job-name=${BASE_NAME}_${NTASKS}x_${NAME_DESC}_${GRID} \
        --ntasks=${NTASKS} \
        --chdir=${WORK_DIR} \
        --time=${TIME} \
        --qos=${QOS} \
	--get-user-env \
        job_hacc.sh ${EX_DIR} ${INPUT_FILE} ${GRID}
