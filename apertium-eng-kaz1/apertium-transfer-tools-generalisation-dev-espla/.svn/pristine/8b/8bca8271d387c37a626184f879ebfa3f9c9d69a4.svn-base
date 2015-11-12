#!/bin/bash

#

# rearrange-cluster.sh

#

#$ -N rearrange-cluster

#$ -cwd

#$ -o $HOME/logs/rearrange.$JOB_ID.out

#$ -e $HOME/logs/rearrange.$JOB_ID.err

DIR_WITH_ORIGINAL_GENERALISATION_PACKAGES=$1
RESULTS_DIR_LOGIN=$2

NUM_PARTS=$3

JOB_DIR=/scratch/vmsanchez/$JOB_ID

mkdir -p $JOB_DIR/originalgen

cp $DIR_WITH_ORIGINAL_GENERALISATION_PACKAGES/generalisation-*.tar.gz  $JOB_DIR/originalgen/
pushd $JOB_DIR/originalgen/
	for FI in generalisation-*.tar.gz ; do
		tar xzf $FI
	done
popd

mkdir -p $JOB_DIR/results
mkdir -p $JOB_DIR/tmp

export TMPDIR=$JOB_DIR/tmp


bash reArrangeGeneralisation.sh $JOB_DIR/originalgen/generalisation $JOB_DIR/results "$NUM_PARTS"

cp $JOB_DIR/results/generalisation-*.tar.gz $RESULTS_DIR_LOGIN/

rm -Rf $JOB_DIR

touch $RESULTS_DIR_LOGIN/0.gen.rearrange.finished