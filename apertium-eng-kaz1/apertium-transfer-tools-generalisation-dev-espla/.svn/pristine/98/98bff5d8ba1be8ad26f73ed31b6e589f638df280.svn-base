#! /bin/bash

DIR=$1
SL=$2
TL=$3

APERTIUMEVALOOLS=/home/vmsanchez/rulesinteractive/apertium-eval-translator

pushd $DIR

for SIZE in `ls | egrep '^translation-combined[[:digit:]]+-firsthuman' | sed 's:^translation-combined::' | sed 's:-firsthuman$::' | sort -n` ; do 

#echo "$SIZE"


TMPSRC=`mktemp`
TMPTRG=`mktemp`
TMPREF=`mktemp`



cat source > $TMPSRC
cat translation-combined$SIZE-firsthuman > $TMPTRG
cat reference > $TMPREF


if [ ! -f bleu.combined-firsthuman.$SIZE ]; then
	$APERTIUMEVALOOLS/bleu.sh $TMPSRC $TMPREF $TMPTRG > bleu.combined-firsthuman.$SIZE &
fi

if [ ! -f ter.combined-firsthuman.$SIZE ]; then
	$APERTIUMEVALOOLS/ter.sh $TMPSRC $TMPREF $TMPTRG > ter.combined-firsthuman.$SIZE &
fi

if [ ! -f meteor.combined-firsthuman.$SIZE ]; then
	$APERTIUMEVALOOLS/meteor-$TL.sh $TMPSRC $TMPREF $TMPTRG > meteor.combined-firsthuman.$SIZE &
fi

wait


BLEU=`cat bleu.combined-firsthuman.$SIZE`
TER=`cat ter.combined-firsthuman.$SIZE`
METEOR=`cat meteor.combined-firsthuman.$SIZE`

echo "$SIZE	$BLEU	$TER	$METEOR"

rm -f $TMPSRC $TMPTRG $TMPREF

done


popd