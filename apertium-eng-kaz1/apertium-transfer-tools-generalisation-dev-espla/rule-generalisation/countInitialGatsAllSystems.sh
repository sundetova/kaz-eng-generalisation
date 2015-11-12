#! /bin/bash

DIR=$1
SL=$2
TL=$3

for SUFFIX in "" "-p40"; do

if [ -d "$DIR$SUFFIX" ]; then

pushd "$DIR$SUFFIX" > /dev/null

for SIZE in `ls | sort -n` ; do 


pushd $SIZE/generalisation > /dev/null

#echo "$SIZE"

if [ ! -f gatsextractedstatistics ]; then

find ./ats -name '*.ats.gz' | while read FILE ; do
	NUMBER=`basename $FILE .ats.gz`
	TOTALATS=`zcat ./ats/$NUMBER.ats.gz | wc -l`
	
	echo "$NUMBER	$TOTALATS" >> gatsextractedstatistics
done
fi

SUM=`cat gatsextractedstatistics | awk -F'\t' '{sum+=$2; } END {print sum;}'`

echo "$SIZE	$SUM"

popd > /dev/null


done

popd >  /dev/null

fi

done