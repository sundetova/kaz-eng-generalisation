# ! /bin/bash


MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

ROOTDIR=$CURDIR/../

CORPORADIR=/work/vmsanchez/rules/corpora/csl-paper-corpora
OUTPURDIR=/work/vmsanchez/rules

for DATA in "es-ca,elperiodico,elPeriodico.nolongsentences.shuf,es-ca," "ca-es,elperiodico,elPeriodico.nolongsentences.shuf,es-ca," "en-es,europarl,Europarl.en-es.nolongsentences.shuf,en-es,--use_fixed_dictionary" "es-en,europarl,Europarl.en-es.nolongsentences.shuf,en-es,--use_fixed_dictionary" "br-fr,ofispublik,OfisPublik.br-fr.norm.nolongsentences.allminuslast3000,br-fr," ; do
	
	PAIR=`echo "$DATA" | cut -f 1 -d ','`
	SL=`echo "$PAIR" | cut -f 1 -d '-'`
	TL=`echo "$PAIR" | cut -f 2 -d '-'`
	
	APERTIUMPAIR=`echo "$DATA" | cut -f 4 -d ','`
	
	CORPUSNAME=`echo "$DATA" | cut -f 2 -d ','`
	CORPUSFILE=`echo "$DATA" | cut -f 3 -d ','`
	
	FIXEDDICPARAM=`echo "$DATA" | cut -f 5 -d ','`
	
	for SIZE in 100 250 500 1000 2500 5000 ; do
		for BILDICVARIANT in "dontallowincompwithbildic," "allowincompwithbildic,allowincompwithbildic" ; do
			BILDCNAME=`echo "$BILDICVARIANT" | cut -f 1 -d ','`
			BILDCPAR=`echo "$BILDICVARIANT" | cut -f 2 -d ','`
			for EXTREMESVARIANT in "endsaligned,ends_aligned" "allphrases,all" ; do
				EXTREMESNAME=`echo "$EXTREMESVARIANT" | cut -f 1 -d ','`
				EXTREMESPAR=`echo "$EXTREMESVARIANT" | cut -f 2 -d ','`
				for PUNCTUATIONVARIANT in "dontallowpunct," "allowpunct,allowpunctuation" ; do
					PUNCTNAME=`echo "$PUNCTUATIONVARIANT" | cut -f 1 -d ','`
					PUNCTPAR=`echo "$PUNCTUATIONVARIANT" | cut -f 2 -d ','`
					
					bash $ROOTDIR/rule-generalisation/copyToCluster.sh "$OUTPURDIR/work-$APERTIUMPAIR-myextractionextendedcorpus-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME/$SIZE/bilingualphrases" "$SL-$TL" "myextractionextendedcorpus-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME" "$SIZE" &
					
				done
			done
			wait
		done
	done

done