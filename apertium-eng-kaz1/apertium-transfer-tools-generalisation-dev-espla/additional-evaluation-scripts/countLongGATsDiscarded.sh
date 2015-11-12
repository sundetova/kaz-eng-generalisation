#! /bin/bash

DIR=$1
SL=$2
TL=$3

GATLENGTH="5"

for SUFFIX in "" "-p40"; do

if [ -d $DIR$SUFFIX ]; then

pushd "$DIR$SUFFIX" > /dev/null

for SIZE in `ls | sort -n` ; do 

pushd $SIZE/beamresult > /dev/null

#echo "$SIZE"



VALIDDIR=false
if [ -f 'result_proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2' ]; then
	RESULTFILE="result_proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2"
	FILTERINGNAME="proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2"
	VALIDDIR=true
else

	NUMBERSFILE=`mktemp`
	find . -name 'result_proportion_correct_bilphrases_thresholdextendedrangerelaxabove*' | sed 's:.*result_proportion_correct_bilphrases_thresholdextendedrangerelaxabove::' > $NUMBERSFILE
	#we like the lowest number
	ABOVENUMBER=`cat $NUMBERSFILE | sort -n | head -n 1`
	RESULTFILE="result_proportion_correct_bilphrases_thresholdextendedrangerelaxabove$ABOVENUMBER"
	FILTERINGNAME="proportion_correct_bilphrases_thresholdextendedrangerelaxabove$ABOVENUMBER"
	rm -f $NUMBERSFILE
fi

if [ $VALIDDIR == true ]; then

BEST_THRESHOLD=`cat $RESULTFILE | tail -n 2 | head -n 1`

MIDDLENUM=1


pushd tuning-$FILTERINGNAME-${BEST_THRESHOLD}-${MIDDLENUM}-${BEST_THRESHOLD}-subrules/ > /dev/null

NUMRESULTLONG=`zcat result-f-$BEST_THRESHOLD.gz  | cut -f 1 -d '|' | awk '{print NF}' | grep "$GATLENGTH" | wc -l`
NUMRESULTLONGBEFORE=`zcat subrules/result-f-$BEST_THRESHOLD.gz  | cut -f 1 -d '|' | awk '{print NF}' | grep "$GATLENGTH" | wc -l`
PROPORTIONSURVIVE=`echo " $NUMRESULTLONG / $NUMRESULTLONGBEFORE" | bc -l `

echo "$SIZE	$PROPORTIONSURVIVE	$NUMRESULTLONG	$NUMRESULTLONGBEFORE"


fi

popd > /dev/null

popd > /dev/null

done

popd > /dev/null

fi 
done