#! /bin/bash

DIR=$1
DIRAPERTIUM=$2
SL=$3
TL=$4

ONLYSIZE=$5
ONLYMETRIC=$6

APERTIUMEVALOOLS=/home/vmsanchez/rulesinteractive/apertium-eval-translator
NTIMES=1000

pushd "$DIR" > /dev/null

for SIZE in `ls | sort -nr` ; do 

if [ "$ONLYSIZE" == "" -o "$ONLYSIZE" == "$SIZE" ]; then

pushd $SIZE/beamresult > /dev/null

#echo "$SIZE"

if [ "$TL" == "es" -o "$TL" == "en" -o "$TL" == "fr" ]; then
METEOR_VARIANT="pa"
else
METEOR_VARIANT="ex"
fi

#RESULTFILE=`find . -name 'result_proportion_correct_bilphrases_thresholdextendedrangerelaxabove*' | head -n 1` 
#ABOVENUMBER=`echo "$RESULTFILE" | sed 's:.*result_proportion_correct_bilphrases_thresholdextendedrangerelaxabove::'`

RESULTFILE="result_proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2"

if [ -f "$RESULTFILE" ]; then

BEST_THRESHOLD=`cat $RESULTFILE | tail -n 2 | head -n 1`
NUM_RULES=`cat $RESULTFILE | tail -n 1`

#if [ "$BEST_THRESHOLD" == "0" ]; then
#	MIDDLENUM="1"
#else
#	MIDDLENUM=$BEST_THRESHOLD
#fi
MIDDLENUM=1

pushd tuning-proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2-${BEST_THRESHOLD}-${MIDDLENUM}-${BEST_THRESHOLD}-subrules/queries/test-f-$BEST_THRESHOLD/experiment/evaluation > /dev/null


#find tt1.0 evaluation file

TRANSLATION_BASE=$DIRAPERTIUM/apertium.$SL-$TL


#run paired bootsrap with 3 metrics

if [ "$ONLYMETRIC" == "" -o "$ONLYMETRIC" == "1" ]; then
if [ ! -f "./paired-bootstrap-handwritten.BLEU" ]; then
	$APERTIUMEVALOOLS/mteval_by_bootstrap_resampling.pl -source source -test translation_learnedrules -testb $TRANSLATION_BASE -ref reference -times $NTIMES -eval $APERTIUMEVALOOLS/bleu.sh  > ./paired-bootstrap-handwritten.BLEU &
fi
fi


if [ "$ONLYMETRIC" == "" -o "$ONLYMETRIC" == "2" ]; then
if [ ! -f "./paired-bootstrap-handwritten.TER" ]; then
	$APERTIUMEVALOOLS/mteval_by_bootstrap_resampling.pl -source source -test translation_learnedrules -testb $TRANSLATION_BASE -ref reference -times $NTIMES -eval $APERTIUMEVALOOLS/ter.sh  > ./paired-bootstrap-handwritten.TER &
fi
fi

if [ "$ONLYMETRIC" == "" -o "$ONLYMETRIC" == "3" ]; then
if [ ! -f "./paired-bootstrap-handwritten.METEOR" ]; then
	$APERTIUMEVALOOLS/mteval_by_bootstrap_resampling.pl -source source -test translation_learnedrules -testb $TRANSLATION_BASE -ref reference -times $NTIMES -eval $APERTIUMEVALOOLS/meteor-$TL.sh  > ./paired-bootstrap-handwritten.METEOR &
fi
fi


wait


popd > /dev/null

fi

popd > /dev/null

fi

done

popd > /dev/null