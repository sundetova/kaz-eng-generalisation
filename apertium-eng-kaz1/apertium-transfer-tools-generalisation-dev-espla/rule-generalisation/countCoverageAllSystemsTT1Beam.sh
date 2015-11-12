#! /bin/bash

#shflags
MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

DIR=$1
SL=$2
TL=$3

TRANSFERTOOLSDIR=$CURDIR
APERTIUMEVALOOLS=/home/vmsanchez/rulesinteractive/apertium-eval-translator

pushd "$DIR" > /dev/null

for SIZE in `ls | sort -n` ; do 

pushd $SIZE > /dev/null

#echo "$SIZE"

if [ -d "test-ttbeam-$SL-$TL" ]; then

pushd test-ttbeam-$SL-$TL > /dev/null

cat trules.tt1beam.$SL-$TL.xml | python $CURDIR/addDebugInfoToTransferRules.py > trules.tt1beam.$SL-$TL.debug.xml

cat trules.tt1beam.$SL-$TL.xml | grep  '<when><!' | sed 's_ *<when><!--__' | sed 's_-->$__' | sed 's_^[0-9]* | __' > alignment-templates-included-in-rules_tt1beam.$SL-$TL

apertium-preprocess-transfer trules.tt1beam.$SL-$TL.debug.xml trules.tt1beam.$SL-$TL.debug.bin

cat modes/$SL-${TL}_tt1beam.mode | sed "s:trules.tt1beam.$SL-$TL.:trules.tt1beam.$SL-$TL.debug.:g" > modes/$SL-${TL}_tt1beam-debug.mode

cat testtest.$SL-$TL.source | bash $CURDIR/translate_apertium.sh "" $SL-${TL}_tt1beam-debug join "" "." > testtest.$SL-$TL.translation_tt1beam-debug 2>testtest.$SL-$TL.translation_tt1beam-debug-debuginfo

cat testtest.$SL-$TL.translation_tt1beam-debug-debuginfo | grep -v "LOCALE:" | grep -v '^0$' | grep -v '^ww' | LC_ALL=C sort | uniq -c | sort -r -n -k 1,1 | sed 's_^ *__'   | while read line ; do FREQ=`echo "$line" | cut -f 1 -d ' ' `; ATNUM=`echo "$line" | cut -f 2 -d ' '`; AT=`head -n $ATNUM alignment-templates-included-in-rules_tt1beam.$SL-$TL | tail -n 1 `;MODAT=`echo "$AT" | sed 's_^[^|]*|__'`; ISNEWAT=0; echo "$FREQ $ISNEWAT $AT"  ; done > report-rules_tt1beam-$SL-$TL.1

cat testtest.$SL-$TL.translation_tt1beam-debug-debuginfo | grep -v "LOCALE:" | grep '^0$' | wc -l > report-rules_tt1beam-$SL-$TL.3

cat report-rules_tt1beam-$SL-$TL.1  report-rules_tt1beam-$SL-$TL.3 | python $CURDIR/addWordInforToReport.py > report-rules_tt1beam-$SL-$TL-words 

COVERAGE=`python $CURDIR/summarizeReport.py  < report-rules_tt1beam-$SL-$TL-words | grep -F 'by rules:' | cut -f 2 -d '(' | cut -f 1 -d ')' | sed 's:%$::'`

echo "$SIZE	$COVERAGE"

popd > /dev/null

fi

popd > /dev/null

done

popd > /dev/null