#! /bin/bash

MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

#shflags
. $CURDIR/../rule-generalisation/shflags

DEFINE_string 'source_language' 'es' 'source language language' 's'
DEFINE_string 'target_language' 'ca' 'target language' 't'
DEFINE_string 'size' '100' 'target language' 'i'

DEFINE_string 'tt1_dir' '' 'transfer tools 1.0 result dir' 'd'

#process parameters
FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"

EVALTOOLSDIR=/home/vmsanchez/rulesinteractive/apertium-eval-translator/

SL=${FLAGS_source_language}
TL=${FLAGS_target_language}

PAIR=$SL-$TL

SIZE=${FLAGS_size}

#dev evaluation

pushd ${FLAGS_tt1_dir}/

for THRESHOLD in  `seq 2 9 ` ; do

	pushd dev-$THRESHOLD-count
	
	#get results from cluster
	scp euler.iuii.ua.es:/home/vmsanchez/results/experiments-linear-l5-$SL-$TL/tt1beam/shuf$SIZE/remove-redundant-default-$THRESHOLD.tar.gz ./
	tar xzf remove-redundant-default-$THRESHOLD.tar.gz
	
	zcat alignment-templates.uniq.$SL-$TL.gz | sed 's: | :\t:' | LC_ALL=C sort -t'	' -k2,2 | gzip > alignment-templates.uniq.$SL-$TL.gz.tabsorted
	zcat remove-redundant-default-$THRESHOLD/initialrules.reduced.gz | LC_ALL=C sort > remove-redundant-default-$THRESHOLD/initialrules.reduced.sorted
	#zcat remove-redundant-default-$THRESHOLD/summary.gz |  sed 's:^[^|]*| ::' | LC_ALL=C sort > remove-redundant-default-$THRESHOLD/initialrules.reduced.sorted
	
	zcat alignment-templates.uniq.$SL-$TL.gz.tabsorted | LC_ALL=C join -t '	' -1 1 -2 2 remove-redundant-default-$THRESHOLD/initialrules.reduced.sorted - | awk -F '\t' '{ print $2 "	" $1 }'  | sed 's:\t: | :' | sort -t '|' -k 2,2  | gzip > alignment-templates.uniq.tt1beam.$PAIR.gz
	
	apertium-gen-transfer-from-aligment-templates -i alignment-templates.uniq.tt1beam.$PAIR.gz -m $THRESHOLD -c count -z  --usediscardrule > trules.tt1beam.$PAIR.xml 2> log.trules.tt1beam.$PAIR
		
	apertium-validate-transfer trules.tt1beam.$PAIR.xml
	apertium-preprocess-transfer trules.tt1beam.$PAIR.xml trules.tt1beam.$PAIR.bin
	
	cat ./modes/$PAIR.mode | sed "s:trules\.$PAIR\.:trules.tt1beam.$PAIR.:g" > ./modes/${PAIR}_tt1beam.mode
	
	cat test.$PAIR.source | bash $CURDIR/../rule-generalisation/translate_apertium.sh "" ${PAIR}_tt1beam join "" "." > test.$PAIR.translation_tt1beam

	$EVALTOOLSDIR/bleu.sh test.$PAIR.source test.$PAIR.reference test.$PAIR.translation_tt1beam > bleu.tt1beam.$PAIR
	
	popd
done

rm -f ./tuning_data.tt1beam.$PAIR
for THRESHOLD in  `seq 2 9 ` ; do
	BLEU=`cat dev-$THRESHOLD-count/bleu.tt1beam.$PAIR`
	echo "$THRESHOLD	$BLEU" >> ./tuning_data.tt1beam.$PAIR
done

BESTTHRESHOLD=`cat ./tuning_data.tt1beam.$PAIR | sort -k2,2 -n -r -t '	' | head -n 1  | cut -f 1 `
MYTESTDIR=`find . -maxdepth 1 -type d -name 'test-*-count' | head -n 1`
MYFULLTESTDIR=`readlink -f $MYTESTDIR`

#got to test directory and translate test corpus
pushd dev-$BESTTHRESHOLD-count
	cat $MYFULLTESTDIR/test.$PAIR.source | bash $CURDIR/../rule-generalisation/translate_apertium.sh "" ${PAIR}_tt1beam join "" "." > testtest.$PAIR.translation_tt1beam
	cat $MYFULLTESTDIR/test.$PAIR.source > testtest.$PAIR.source
	cat $MYFULLTESTDIR/test.$PAIR.reference > testtest.$PAIR.reference
	#$EVALTOOLSDIR/bleu.sh testtest.$PAIR.source testtest.$PAIR.reference testtest.$PAIR.translation_tt1beam > bleutest.tt1beam.$PAIR
	#cat bleutest.tt1beam.$PAIR
popd

rm -f test-ttbeam-$PAIR
ln -s dev-$BESTTHRESHOLD-count test-ttbeam-$PAIR

popd