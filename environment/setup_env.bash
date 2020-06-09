#
# MareNostrum III is a supercomputer based on Intel SandyBridge processors, iDataPlex Compute Racks, 
# a Linux Operating System and an Infiniband interconnection. The total number of processors is 
# 33,664 Intel SandyBridge-EP E5-2670 cores at 2.6 GHz (2,104 compute nodes) with 94.625 TB of main memory. 
#
# Contact: Vitali Morozov morozov@anl.gov
#
export COMPILERVARS_ARCHITECTURE=intel64
source /apps/INTEL/2017.4/compilers_and_libraries/linux/bin/compilervars.sh


module load openmp

export HACC_PLATFORM="mn4"
export HACC_OBJDIR="${HACC_PLATFORM}"

export HACC_CFLAGS="-O3 -fopenmp"
export HACC_CC="gcc"

export HACC_CXXFLAGS="-O3 -fopenmp"
export HACC_CXX="g++"

export HACC_LDFLAGS="-lm"

export HACC_MPI_CFLAGS="-O3 -fopenmp -Wall -std=c99"
export HACC_MPI_CC="/apps/INTEL/2017.4/impi/2017.3.196/bin64/mpicc"

#export HACC_MPI_CXXFLAGS="-O3 -fopenmp -Wall -Wno-deprecated"
export HACC_MPI_CXXFLAGS="-O3 -fopenmp"
export HACC_MPI_CXX="/apps/INTEL/2017.4/impi/2017.3.196/bin64/mpicxx"

export HACC_MPI_LDFLAGS="-lm"

export FFTW_MAJOR_VERSION=3.3.6
name=fftw
version='3.3.6'

module load ${name}/3.3.6

root=/apps/BSCTOOLS/deps/${name}/3.3.6

export FFTW_HOME=${root}
export FFTW_INCLUDE=${FFTW_HOME}/include:${FFTW_HOME}/../src/src-fftw-3.3.6/mpi
export CPATH=${FFTW_INCLUDE}:${CPATH}

export LD_LIBRARY_PATH=${root}/lib:${LD_LIBRARY_PATH}
export HACC_LDFLAGS="${HACC_LDFLAGS} -Xlinker -rpath -Xlinker ${root}/lib"
export HACC_MPI_LDFLAGS="${HACC_MPI_LDFLAGS} -Xlinker -rpath -Xlinker ${root}/lib -lpthread -lrt"

export INFOPATH=${root}/share/info:${INFOPATH}
export MANPATH=${root}/share/man:$MANPATH
export PATH=${root}/bin:${PATH}

module load gcc/7.2.0
module load BSCTOOLS
module load papi
