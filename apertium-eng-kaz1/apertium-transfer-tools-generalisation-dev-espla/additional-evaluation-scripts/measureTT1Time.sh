#! /bin/bash

MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

TRANSFERTOOLSSCRIPTS=/work/vmsanchez/rules/apertium-transfer-tools-generalisation-dev/phrase-extraction/transfer-tools-scripts

#shflags
. $CURDIR/../rule-generalisation/shflags

DEFINE_string 'dir' '' 'directory where the results can be found' 'd'
DEFINE_string 'pair' '' 'language pair' 'p'

#process parameters
FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"

DIR=${FLAGS_dir}
PAIR=${FLAGS_pair}

pushd $DIR

THRESHOLD=`cat result-$PAIR | tr '\t' ' ' | cut -f 4 -d ' '`

pushd test-$THRESHOLD-count
	zcat log.aligtem.$PAIR.gz | grep '^Alignment templates extraction took' | cut -f 5 -d ' ' > generalisationTime.$PAIR
	/usr/bin/time -f "%e" bash -c  "zcat alignment-templates.$PAIR.gz | $TRANSFERTOOLSSCRIPTS/filter_alignment_templates.awk | cut -d' ' -f1 --complement | sort | uniq -c | sed -re 's/^[ ]+//g' | sort -t '|' -k 2,2 | gzip > /dev/null" 2> minimisationTime.$PAIR
	cat generalisationTime.$PAIR minimisationTime.$PAIR | awk '{ sum += $0 } END { print sum }' > totaltime.$PAIR
popd

ln -s test-$THRESHOLD-count/totaltime.$PAIR .

popd