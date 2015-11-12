#! /bin/bash

DIR=$1
SL=$2
TL=$3

pushd "$DIR" > /dev/null

for SIZE in `ls | sort -n` ; do 

pushd $SIZE > /dev/null

if [ -d "test-ttbeam-$SL-$TL" ] ; then

NUM_RULES=`zcat test-ttbeam-$SL-$TL/alignment-templates.uniq.tt1beam.$SL-$TL.gz | wc -l`

echo "$SIZE	$NUM_RULES"

fi

popd > /dev/null

done

popd > /dev/null