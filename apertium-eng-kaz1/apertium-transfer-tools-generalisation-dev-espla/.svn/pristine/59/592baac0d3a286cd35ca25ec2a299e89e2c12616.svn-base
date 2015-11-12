# ! /bin/bash


MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`


DISCARDFIRST4=true

NUMEXPERIMENT=0

for DATA in "es-ca,elperiodico,consumereroski.r3000v2,es-ca," "ca-es,consumereroski.r3000v2,es-ca," "en-es,europarl,newstest2013,en-es,--use_fixed_dictionary" "es-en,europarl,newstest2013,en-es,--use_fixed_dictionary" "br-fr,ofispublik,OfisPublik.br-fr.norm.nolongsentences.last3000,br-fr," ; do
	
	PAIR=`echo "$DATA" | cut -f 1 -d ','`
	SL=`echo "$PAIR" | cut -f 1 -d '-'`
	TL=`echo "$PAIR" | cut -f 2 -d '-'`
	
	APERTIUMPAIR=`echo "$DATA" | cut -f 4 -d ','`
	
	CORPUSNAME=`echo "$DATA" | cut -f 2 -d ','`
	TESTFILE=`echo "$DATA" | cut -f 3 -d ','`
	
	FIXEDDICPARAM=`echo "$DATA" | cut -f 5 -d ','`
	
	INVERSEFLAG=""
	if [ "$PAIR" != "$APERTIUMPAIR" ]; then
		INVERSEFLAG="--inverse_pair INVERSE"
	fi
	
	FIXEDDICFLAG=""
	if [ "$FIXEDDICPARAM" != "" ]; then
		FIXEDDICFLAG="--use_fixed_bildic"
	fi
	
	
	
	#for SIZE in 100 250 500 1000 2500 5000 ; do
	for SIZE in 100 250 500  ; do
		for BILDICVARIANT in "dontallowincompwithbildic," "allowincompwithbildic,allowincompwithbildic" ; do
			BILDCNAME=`echo "$BILDICVARIANT" | cut -f 1 -d ','`
			BILDCPAR=`echo "$BILDICVARIANT" | cut -f 2 -d ','`
			for EXTREMESVARIANT in "endsaligned,ends_aligned" "allphrases,all" ; do
				EXTREMESNAME=`echo "$EXTREMESVARIANT" | cut -f 1 -d ','`
				EXTREMESPAR=`echo "$EXTREMESVARIANT" | cut -f 2 -d ','`
				for PUNCTUATIONVARIANT in "dontallowpunct," "allowpunct,allowpunctuation" ; do
					PUNCTNAME=`echo "$PUNCTUATIONVARIANT" | cut -f 1 -d ','`
					PUNCTPAR=`echo "$PUNCTUATIONVARIANT" | cut -f 2 -d ','`
					
					NUMEXPERIMENT=`expr $NUMEXPERIMENT + 1`
					
					if [ $NUMEXPERIMENT -gt 1 -o $DISCARDFIRST4 == false ]; then
					
					MYEXE=`mktemp`
					
					echo "nohup bash run-all-steps-on-cluster.sh --source_language $SL --target_language $TL --size $SIZE --alg_version REFTOBILINGPAPEREXPLICIT --filtering_method proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2 --bilingual_phrases_id myextractionextendedcorpus-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME-reftobilingpaperexplicit --num_parts 20 --dev_corpus FROM_BILPHRASES_DIR --test_corpus $TESTFILE $INVERSEFLAG $FIXEDDICFLAG  > ../logs/nohup-$PAIR-myextractionextendedcorpus-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME-reftobilingpaperexplicit-$SIZE &" > $MYEXE
					
					source $MYEXE
					
					rm -f $MYEXE
					
					fi
					
					#bash $ROOTDIR/rule-generalisation/copyToCluster.sh "$OUTPURDIR/work-$APERTIUMPAIR-myextractionextendedcorpus-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME/$SIZE/bilingualphrases" "$SL-$TL" "myextractionextendedcorpus-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME" "$SIZE" &
					
				done
			done
			
		done
	done

done
