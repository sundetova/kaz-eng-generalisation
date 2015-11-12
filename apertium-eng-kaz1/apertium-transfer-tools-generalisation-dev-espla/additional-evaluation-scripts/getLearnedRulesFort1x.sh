#! /bin/bash


MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

#shflags
. $CURDIR/../rule-generalisation/shflags

DEFINE_string 'dir' '' 'directory where the results can be found' 'd'
DEFINE_string 'source_language' '' 'source language' 's'
DEFINE_string 'target_language' '' 'target language' 't'
DEFINE_string 'output_dir' '' 'output dir' 'o'
DEFINE_boolean 'without_chunks' 'false' 'do not generate chunks' 'c'

#process parameters
FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"

DIR=${FLAGS_dir}
SL=${FLAGS_source_language}
TL=${FLAGS_target_language}
OUTPUTDIR=${FLAGS_output_dir}

TAGGROUPS=$CURDIR/../rule-generalisation/taggroups_$SL-$TL

CHUNKSARG="--generatechunks"
CHUNKSSUFFIX=".chunks"

if [ ${FLAGS_without_chunks} == ${FLAGS_TRUE} ]; then

CHUNKSARG=""
CHUNKSSUFFIX=""

fi

for SUFFIX in "" "-p40"; do

if [ -d "$DIR$SUFFIX" ]; then
	
	pushd "$DIR$SUFFIX" > /dev/null

	for SIZE in `ls | sort -n` ; do 
	
		if [ -d "$SIZE/beamresult" ]; then
		
		pushd $SIZE/beamresult
		
		RESULTFILE="result_proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2"
		BEST_THRESHOLD=`cat $RESULTFILE | tail -n 2 | head -n 1`
		
		EXPQUERIESDIR=tuning-proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2-$BEST_THRESHOLD-1-$BEST_THRESHOLD-subrules/queries/test-f-$BEST_THRESHOLD/experiment/
		
		apertium-gen-transfer-from-aligment-templates --input $EXPQUERIESDIR/rules/alignmentTemplates.txt --attributes $TAGGROUPS --generalise --nodoublecheckrestrictions --usediscardrule --emptyrestrictionsmatcheverything $CHUNKSARG > $OUTPUTDIR/learned$SIZE$CHUNKSSUFFIX.t1x
		
		popd
		
		fi
	done
	
	popd
	
fi

done