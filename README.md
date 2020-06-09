# Hardware Accelerated Cosmology Code (HACC) performance analysis on MareNostrum4
This repository contains the source files for the analysis of the Hardware Accelerated Cosmology Code (HACC) framework on 
MareNostrum4, the supercomputer of the Barcelona Supercomputing Center (BSC).
This analysis has been carried out as a case study for the Parallel Programming Tools and Models, a Master course for the spring 
semester at the UPC.

## Structure of the repository

Once built the executable, this should be moved under the `ex` folder. The content of the other files and directories, all important to run
the analysis, is described below:

- `HACC_src`: contains all the HACC source code, needed just to build the program. Moreover, it contains also some jobs 
examples (they are not for the MareNostrum)

- `analysis`: contains all the scripts to run the analysis

- `environment`: contains the bash files to setup the environment

- `ex`: contains the executables and some input data necessary for HACC

- `extrae_conf`: contains the xml configuration files for extrae used for different kinds of analysis

- `indat`: contains the input files for the different analysis. They're divided in multiple sub-folders, it should be easy to 
recognize which input file belongs to which analysis.

- `utils`: contains a couple of useful scripts that I used during the analysis. The file `run_test.sh` can be used for both testing
if the program is working correctly or as a template for new analysis scripts.

- `extrae.xml`: it is the extrae configuration file used for the current run

- `job_hacc.sh`: it is the job file that needs to be sent to the SLURM queue

- `sbatch_hacc.sh`: it is the file that, based on some input parameters or environment variables, runs the correct `sbatch` command
to send `job_hacc.sh` to the SLURM queue


## HACC set-up

As said in the README of the HACC source code, inside the folder `HACC_src/src/env` there are several examples of environment
setup. This environment is necessary to launch the build using the Makefiles. It requires to fill some environment variables
with the dependencies locations.

The MareNostrum4 environment I used for both the setup and the application run-time, are contained in the the folder `environment`.

Once successfully sourced from the setup_env bash file, by running `source environment/set_env.bash`, building the framework 
is as simply as launching `make` under `HACC_src/src/cpu`. This will generate an executable file named `hacc_tpm` under the 
`HACC_src` folder. This needs to be moved under the `ex` directory.


## Run the analysis

To run the analysis scripts contained in the `analysis` directory, the scripts need to be executed under the main directory
(e.g. `./analysis/weak.sh`).

NB: all the scripts will source the `run_env.bash` file if some dependencies are not loaded before.


