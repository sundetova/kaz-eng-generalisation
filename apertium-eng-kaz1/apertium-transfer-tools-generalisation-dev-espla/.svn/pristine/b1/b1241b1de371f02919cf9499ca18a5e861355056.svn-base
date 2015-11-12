#! /bin/bash

MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

#shflags
. $CURDIR/../rule-generalisation/shflags

DEFINE_string 'dir' '' 'directory where the results can be found' 'd'

#process parameters
FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"

DIR=${FLAGS_dir}

pushd $DIR

THRESHOLD=`cat beamresult/result_proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2 | tail -n 2 | head -n 1`

FILESFILE=`mktemp`

find filtering-proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2/debug -name "*-f-$THRESHOLD.result.debug.gz" > $FILESFILE

rm allminimisationtimes-f-$THRESHOLD
while read FILE ; do

zcat $FILE | tail -n 1 | cut -f 3 -d ' ' >> allminimisationtimes-f-$THRESHOLD

done < $FILESFILE

#sum times
grep -v -F 'arg' allminimisationtimes-f-$THRESHOLD | awk '{ sum += $0 } END { print sum }' > totalminimisationtime-f-$THRESHOLD

popd $DIR


rm $FILESFILE