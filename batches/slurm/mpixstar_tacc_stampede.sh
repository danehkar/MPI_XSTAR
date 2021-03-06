#!/bin/bash
#SBATCH -A TG-PROJECT-NO      # TACC Project number
#SBATCH -p normal             # Partition to submit to
#SBATCH -J mpixstar           # Jon name
#SBATCH -n 32                 # Number of cores
#SBATCH -t 48:00:00           # Runtime in minutes
#SBATCH -o mpixstar_%j.out    # File to which STDOUT will be written
#SBATCH -e mpixstar_%j.err    # File to which STDERR will be written
#SBATCH --mail-user=youremail@mit.edu # Email to which notifications will be sent
#SBATCH --mail-type=begin     # email me when the job starts
#SBATCH --mail-type=end       # email me when the job finishes
#
module load gcc mvapich2
#
ibrun -np 32 ./mpixstar cfrac=0.4 \
temperature=100. lcpres=0 pressure=0.03 spectrum='pow' spectun=0 trad=-1. \
density=1.0e+12 densitytyp=0 columnsof=1.0e+21 columntyp=2 \
column=1.e+23 columnnst=5 columnint=1 rlrad38=1.e+6 rlogxityp=2 \
rlogxisof=0 rlogxi=4 rlogxinst=5 rlogxiint=0 \
habund=1 heabund=1 liabund=0 beabund=0 babund=0 cabund=1 \
nabund=1 oabund=1 fabund=0 neabund=1 naabund=0 mgabund=1 \
alabund=1 siabund=1 pabund=0 sabund=1 clabund=0 arabund=1 \
kabund=0 caabund=1 scabund=0 tiabund=0 vabund=0 crabund=1 \
mnabund=0 feabund=1 coabund=0 niabund=1 cuabund=0 znabund=0 \
modelname='xstar_pg1211' nsteps=10 niter=99 \
lwrite=0 lprint=1 lstep=0 emult=0.5 taumax=5. radexp=0. \
xeemin=0.1 critf=1.e-6 vturbi=100. npass=1 ncn2=9999
#
echo = `date` job $JOB_NAME done.
echo "Program mpixstar finished with exit code $? at: `date`" >> mpixstar.info
