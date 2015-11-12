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


FILESFILE=`mktemp`

find generalisation/debug -name "debug-generalisation-*.gz" > $FILESFILE

rm allgeneralisationtimes
while read FILE ; do

zcat $FILE | grep '^Time' | grep '^Time' | cut -f 2 -d ':' | tr -d ' ' >> allgeneralisationtimes

done < $FILESFILE

#sum times
grep -v -F 'arg' allgeneralisationtimes | awk '{ sum += $0 } END { print sum }' > totalgeneralisationtime

popd $DIR


rm $FILESFILE