# ! /bin/bash


MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

ROOTDIR=$CURDIR/../

CORPORADIR=/work/vmsanchez/rules/corpora/csl-paper-corpora
OUTPURDIR=/work/vmsanchez/rules

for DATA in "es-ca,elperiodico,elPeriodico.nolongsentences.shuf,es-ca," "en-es,europarl,Europarl.en-es.nolongsentences.shuf,en-es,--use_fixed_dictionary" "br-fr,ofispublik,OfisPublik.br-fr.norm.nolongsentences.allminuslast3000,br-fr," ; do
	
	PAIR=`echo "$DATA" | cut -f 1 -d ','`
	SL=`echo "$PAIR" | cut -f 1 -d '-'`
	TL=`echo "$PAIR" | cut -f 2 -d '-'`
	
	APERTIUMPAIR=`echo "$DATA" | cut -f 4 -d ','`
	
	CORPUSNAME=`echo "$DATA" | cut -f 2 -d ','`
	CORPUSFILE=`echo "$DATA" | cut -f 3 -d ','`
	
	FIXEDDICPARAM=`echo "$DATA" | cut -f 5 -d ','`
	
	for SIZE in 100 250 500 1000 2500 5000 ; do
		for BILDICVARIANT in "dontallowincompwithbildic," ; do
			BILDCNAME=`echo "$BILDICVARIANT" | cut -f 1 -d ','`
			BILDCPAR=`echo "$BILDICVARIANT" | cut -f 2 -d ','`
			for EXTREMESVARIANT in "endsaligned,ends_aligned"  ; do
				EXTREMESNAME=`echo "$EXTREMESVARIANT" | cut -f 1 -d ','`
				EXTREMESPAR=`echo "$EXTREMESVARIANT" | cut -f 2 -d ','`
				for PUNCTUATIONVARIANT in "dontallowpunct," ; do
					PUNCTNAME=`echo "$PUNCTUATIONVARIANT" | cut -f 1 -d ','`
					PUNCTPAR=`echo "$PUNCTUATIONVARIANT" | cut -f 2 -d ','`
					
					mkdir -p $OUTPURDIR/work-$PAIR-myextractionextendedcorpuswithretratosdict-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME 
					
					nohup bash $ROOTDIR/extract-rules.sh --source_language $SL --target_language $TL --corpus $CORPORADIR/$CORPUSFILE --giza_dir /home/vmsanchez/wmt/tools/giza-pp/GIZA++-v2/ --data_dir /home/vmsanchez/hybridmt/tools/apertium-$APERTIUMPAIR --apertium_prefix /home/vmsanchez/rulesinteractive/local --tmp_dir $OUTPURDIR/work-$PAIR-myextractionextendedcorpuswithretratosdict-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME/$SIZE --discard_a_fifth_of_corpus --only_extract_bilingual_phrases --corpus_head_size $SIZE --variant "$BILDCPAR" --extremes_variant "$EXTREMESPAR" --punctuation_variant "$PUNCTPAR" --alignments_with_bildic $FIXEDDICPARAM --override_bin_bil_dir $OUTPURDIR/work-$PAIR-retratoslearnedlex-myextractionextendedcorpus-$CORPUSNAME-thesis-endsaligned-dontallowincompwithbildic-dontallowpunct-onlydict/$SIZE/$PAIR-retratos.autobil.bin --override_bin_bil_inv $OUTPURDIR/work-$TL-$SL-retratoslearnedlex-myextractionextendedcorpus-$CORPUSNAME-thesis-endsaligned-dontallowincompwithbildic-dontallowpunct-onlydict/$SIZE/$TL-$SL-retratos.autobil.bin > $OUTPURDIR/work-$PAIR-myextractionextendedcorpuswithretratosdict-$CORPUSNAME-thesis-$EXTREMESNAME-$BILDCNAME-$PUNCTNAME/nohup.$SIZE.out &
					
				done
			done
		done
	done
	wait

done