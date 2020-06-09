#!/bin/sh

export EXTRAE_CONFIG_FILE=/home/pptm71/pptm71021/analysis_HACC/extrae.xml
export LD_PRELOAD=${EXTRAE_HOME}/lib/libmpitrace.so

## Run the desired program
$*
