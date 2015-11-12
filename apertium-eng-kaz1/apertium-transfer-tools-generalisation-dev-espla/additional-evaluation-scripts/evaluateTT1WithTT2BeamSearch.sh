#! /bin/bash

MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

#shflags
. $CURDIR/../rule-generalisation/shflags

DEFINE_string 'source_language' 'es' 'source language language' 's'
DEFINE_string 'target_language' 'ca' 'target language' 't'

DEFINE_string 'tt1_dir' '' 'transfer tools 1.0 result dir' 'd'
DEFINE_string 'tt2_dir' '' 'transfer tools 2.0 result dir' 'e'


#process parameters
FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"

DIR1=${FLAGS_tt1_dir}
DIR2=${FLAGS_tt2_dir}

PAIR="${FLAGS_source_language}-${FLAGS_target_language}"


pushd $DIR1
for DIRSIZE in * ; do

if [ -d $DIRSIZE ]; then
	pushd $DIRSIZE
		BEST_THRESHOLD_TT1=`cat result-$PAIR | tr '\t' ' ' | sed 's:[ ][ ]*: :g' | cut -f 4 -d ' '`
		pushd test-$BEST_THRESHOLD_TT1-count
		
		#now find TT2 result
		
		TT2RESULTSDIR=$DIR2/$DIRSIZE/beamresult
		
		if [ ! -d "$TT2RESULTSDIR" ]; then
			TT2RESULTSDIR=${DIR2}-p40/$DIRSIZE/beamresult
		fi
		
		if [ -d "$TT2RESULTSDIR" ]; then
		
		BEST_THRESHOLD_TT2=`cat $TT2RESULTSDIR/result_proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2 | tail -n 2 | head -n 1`
		TT2ATS=$TT2RESULTSDIR/tuning-proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2-$BEST_THRESHOLD_TT2-1-$BEST_THRESHOLD_TT2-subrules/subrules/result-f-$BEST_THRESHOLD_TT2.gz
		
		#filter TT1 ATs
		python $CURDIR/../rule-generalisation/filterTT1ATWithTT2cats.py --tt1_ats ./alignment-templates.uniq.$PAIR.gz --tt2_ats $TT2ATS | gzip > ./alignment-templates.uniq.filteredtt2.$PAIR.gz
		
		#create XML rules
		apertium-gen-transfer-from-aligment-templates -i alignment-templates.uniq.filteredtt2.$PAIR.gz -m $BEST_THRESHOLD_TT1 -c count -z  --usediscardrule > trules.filteredtt2.$PAIR.xml 2> log.trules.filteredtt2.$PAIR
		
		apertium-validate-transfer trules.filteredtt2.$PAIR.xml
		apertium-preprocess-transfer trules.filteredtt2.$PAIR.xml trules.filteredtt2.$PAIR.bin
		
		cat ./modes/$PAIR.mode | sed "s:trules\.$PAIR\.:trules.filteredtt2.$PAIR.:g" > ./modes/${PAIR}_filteredtt2.mode
		
		cat test.$PAIR.source | bash $CURDIR/../rule-generalisation/translate_apertium.sh "" ${PAIR}_filteredtt2 join "" "." > test.$PAIR.translation_filteredtt2
		
		fi
		
		popd
	popd
fi

done

popd