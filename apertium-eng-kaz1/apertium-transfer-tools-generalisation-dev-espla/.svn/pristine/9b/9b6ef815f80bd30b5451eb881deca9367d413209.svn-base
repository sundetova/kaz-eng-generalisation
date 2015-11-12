#! /bin/bash


MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

#shflags
. $CURDIR/../rule-generalisation/shflags

DEFINE_string 'source_language' 'es' 'source language language' 's'
DEFINE_string 'target_language' 'ca' 'target language' 't'

DEFINE_string 'tt2_dir' '' 'transfer tools 2.0 result dir' 'e'
DEFINE_string 'output_dir' '' 'directory where the results will be stored' 'o'
DEFINE_string 'tt1_mode' '' 'mode file from TT 1.0' 'm'
DEFINE_string 'test_corpus' '' 'test corpus' 'v'
DEFINE_boolean 'use_learned_bildic' false 'Use bildic inferred from the corpus instead of from Apertium' 'b'
DEFINE_boolean 'dont_learn_rules' false 'Do not infer rules' 'n'

#process parameters
FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"

APERTIUMEVALOOLS="/home/vmsanchez/rulesinteractive/apertium-eval-translator"
RETRATOSDIR="/home/vmsanchez/rulesinteractive/retratos-0.8.0"

RULEGENDIR=$CURDIR/../rule-generalisation/

DIR2=${FLAGS_tt2_dir}
PAIR="${FLAGS_source_language}-${FLAGS_target_language}"
SL=${FLAGS_source_language}
TL=${FLAGS_target_language}
OUTDIR=${FLAGS_output_dir}


LEARNRULES=true
if [ "${FLAGS_dont_learn_rules}" == "${FLAGS_TRUE}"  ]; then
	LEARNRULES=false
fi


LEARNEDIC=false

if [ "${FLAGS_use_learned_bildic}" == "${FLAGS_TRUE}"  ]; then
	LEARNEDIC=true
fi

BANNEDCATS="cm,sent,guio,rlpar,rlquest"
RETRATOSRESULTDIR="ReTraTos_rules_${SL}X${TL}_pi=0.0015_pf=0.5_pos_3_-$BANNEDCATS"
ORIGINALMODE=${FLAGS_tt1_mode}

TESTSOURCE="${FLAGS_test_corpus}.$SL"
TESTREFERENCE="${FLAGS_test_corpus}.$TL"

pushd $DIR2

for DIRSIZE in `ls | sort -n ` ; do

	if [ -d $DIRSIZE/bilingualphrases -a "$DIRSIZE" != "10000" ]; then
		mkdir -p $OUTDIR/$DIRSIZE
		
		echo "Evaluating retratos for size $DIRSIZE"
		
		#convert sentences
		python $RULEGENDIR/convertSentencesToRetratos.py --sentences $DIRSIZE/bilingualphrases/alignments.$PAIR.gz.toBilphrase.gz --output_sl $OUTDIR/$DIRSIZE/$SL.prev.txt --output_tl $OUTDIR/$DIRSIZE/$TL.prev.txt --output_dic_header $OUTDIR/$DIRSIZE/dic_header.xml 
		
		cat $OUTDIR/$DIRSIZE/$SL.prev.txt | sed 's:<@+:<ATSYMBOLPLUS:g' | sed 's:<@-:<ATSYMBOLMINUS:g' > $OUTDIR/$DIRSIZE/$SL.txt
		cat $OUTDIR/$DIRSIZE/$TL.prev.txt | sed 's:<@+:<ATSYMBOLPLUS:g' | sed 's:<@-:<ATSYMBOLMINUS:g' > $OUTDIR/$DIRSIZE/$TL.txt
		
		pushd $OUTDIR/$DIRSIZE
		
		#create dictionary if option is enabled
		if [ $LEARNEDIC == true  ]; then
			PERL5LIB=$RETRATOSDIR $RETRATOSDIR/ReTraTos_lex -s $SL.txt -t $TL.txt -b dic_header.xml   -e $RETRATOSDIR/test/dic_footer.txt -f 9999999999999999 -l 1 &> retratos-lex.log
			#remove buggy multi-word entries and entries containing unknown words
 			cat ReTraTos_lex_${SL}X${TL}_9999999999999999.dix | grep -v -F '<j/>' | grep -v '<l>[^<]*<\/l' | grep -v '<r>[^<]*<\/r'  |  python $RULEGENDIR/convertRetratosDictToApertium.py | sed 's:<s n="NC"/>::g' |  sed 's:<s n="ATSYMBOLPLUS:<s n="@+:g' | sed 's:<s n="ATSYMBOLMINUS:<s n="@-:g' > $SL-$TL-retratos.dix
 			#compile dictionary
 			lt-comp lr $SL-$TL-retratos.dix $SL-$TL-retratos.autobil.bin
		fi
		
		
		
		if [ $LEARNRULES == true ]; then
		
		#create rules
		rm -f tuning_data_pi
		#optimize frequency threshold for pattern identification
		for PITHRESHOLD in `LC_ALL=C seq 0 0.05 1` ; do
			PERL5LIB=$RETRATOSDIR $RETRATOSDIR/ReTraTos_rules -s $SL.txt -t $TL.txt -pi $PITHRESHOLD -eg "$BANNEDCATS" -fi -so &> retratos-pi$PITHRESHOLD.log
			#convert rules to Apertium XMLformat
			
			LOCRETRATOSRESULTDIR="ReTraTos_rules_${SL}X${TL}_pi=${PITHRESHOLD}_pf=0.5_pos_3_-$BANNEDCATS"
			
			cat $LOCRETRATOSRESULTDIR/transfer_rules_pos.txt | sed 's:\(<|\|\)ATSYMBOLPLUS:\1@+:g' | sed 's:\(<|\|\)ATSYMBOLMINUS:\1@-:g' > $LOCRETRATOSRESULTDIR/transfer_rules_pos.fixed.txt
			
			python $RULEGENDIR/retratosrules2apertium.py --retratos_rules $LOCRETRATOSRESULTDIR/transfer_rules_pos.fixed.txt > ${PAIR}-pi${PITHRESHOLD}-retratos.xml
		
			#compile rules
			apertium-preprocess-transfer ${PAIR}-pi${PITHRESHOLD}-retratos.xml ${PAIR}-pi${PITHRESHOLD}-retratos.bin
		
			#obtain mode
			mkdir -p modes
			cat $ORIGINALMODE | sed -r "s: trules\.$PAIR.xml: $PWD/${PAIR}-pi${PITHRESHOLD}-retratos.xml:" | sed -r "s: trules\.$PAIR.bin: $PWD/${PAIR}-pi${PITHRESHOLD}-retratos.bin:" > modes/${PAIR}-pi${PITHRESHOLD}-retratos.mode
			
			MODESUFFIX=""
			if [ $LEARNEDIC == true  ]; then
				MODESUFFIX="-learnedlex"
				cat modes/${PAIR}-pi${PITHRESHOLD}-retratos.mode | sed -r "s: [^ ]*$SL-$TL\.autobil.bin : $PWD/$SL-$TL-retratos.autobil.bin :" > modes/${PAIR}-pi${PITHRESHOLD}-retratos$MODESUFFIX.mode
			fi
		
			#translate dev+train corpus
			zcat $DIR2/$DIRSIZE/bilingualphrases/$SL.txt.gz > devtrain.src
			zcat $DIR2/$DIRSIZE/bilingualphrases/$TL.txt.gz > devtrain.ref
			ln -s $CURDIR/../phrase-extraction/transfer-tools-scripts/apertium-??-??.posttransfer.ptx ./
			cat devtrain.src | bash $RULEGENDIR/translate_apertium.sh "" ${PAIR}-pi${PITHRESHOLD}-retratos$MODESUFFIX join "" "." > devtrain.pi${PITHRESHOLD}-retratos
		
			#evaluate
			$APERTIUMEVALOOLS/bleu.sh devtrain.src devtrain.ref devtrain.pi${PITHRESHOLD}-retratos > bleu.pi${PITHRESHOLD}-retratos
			BLEU=`cat bleu.pi${PITHRESHOLD}-retratos`
			echo "$PITHRESHOLD	$BLEU" >> tuning_data_pi
			
			rm ${PAIR}-pi${PITHRESHOLD}-retratos.xml
		done
		
		#choose BEST PI Threshold
		BESTPI=`cat tuning_data_pi | sort -k2,2 -n -r | head -n 1 | cut -f 1`
		echo "Best pi threshold = $BESTPI"
		
		rm -f tuning_data_pf
		for PFTHRESHOLD in `LC_ALL=C seq 0 0.05 1` ; do
			PERL5LIB=$RETRATOSDIR $RETRATOSDIR/ReTraTos_rules -s $SL.txt -t $TL.txt -pi $BESTPI -pf $PFTHRESHOLD  -eg "$BANNEDCATS" -fi -so &> retratos-pf$PFTHRESHOLD.log
			#convert rules to Apertium XMLformat
			
			LOCRETRATOSRESULTDIR="ReTraTos_rules_${SL}X${TL}_pi=${BESTPI}_pf=${PFTHRESHOLD}_pos_3_-$BANNEDCATS"
			
			cat $LOCRETRATOSRESULTDIR/transfer_rules_pos.txt | sed 's:\(<|\|\)ATSYMBOLPLUS:\1@+:g' | sed 's:\(<|\|\)ATSYMBOLMINUS:\1@-:g' > $LOCRETRATOSRESULTDIR/transfer_rules_pos.fixed.txt
			
			python $RULEGENDIR/retratosrules2apertium.py --retratos_rules $LOCRETRATOSRESULTDIR/transfer_rules_pos.fixed.txt > ${PAIR}-pf${PFTHRESHOLD}-retratos.xml
		
			#compile rules
			apertium-preprocess-transfer ${PAIR}-pf${PFTHRESHOLD}-retratos.xml ${PAIR}-pf${PFTHRESHOLD}-retratos.bin
		
			#obtain mode
			mkdir -p modes
			cat $ORIGINALMODE | sed -r "s: trules\.$PAIR.xml: $PWD/${PAIR}-pf${PFTHRESHOLD}-retratos.xml:" | sed -r "s: trules\.$PAIR.bin: $PWD/${PAIR}-pf${PFTHRESHOLD}-retratos.bin:" > modes/${PAIR}-pf${PFTHRESHOLD}-retratos.mode
			
			MODESUFFIX=""
			if [ $LEARNEDIC == true ]; then
				MODESUFFIX="-learnedlex"
				cat modes/${PAIR}-pf${PFTHRESHOLD}-retratos.mode | sed -r "s: [^ ]*$SL-$TL\.autobil.bin : $PWD/$SL-$TL-retratos.autobil.bin :" > modes/${PAIR}-pf${PFTHRESHOLD}-retratos$MODESUFFIX.mode
			fi
		
			#translate dev corpus
			cat $DIR2/$DIRSIZE/bilingualphrases/devcorpus.$DIRSIZE.$SL > dev.src
			cat $DIR2/$DIRSIZE/bilingualphrases/devcorpus.$DIRSIZE.$TL > dev.ref
			ln -s $CURDIR/../phrase-extraction/transfer-tools-scripts/apertium-??-??.posttransfer.ptx ./
			cat dev.src | bash $RULEGENDIR/translate_apertium.sh "" ${PAIR}-pf${PFTHRESHOLD}-retratos$MODESUFFIX join "" "." > dev.pf${PFTHRESHOLD}-retratos
		
			#evaluate
			$APERTIUMEVALOOLS/bleu.sh dev.src dev.ref dev.pf${PFTHRESHOLD}-retratos > bleu.pf${PFTHRESHOLD}-retratos
			BLEU=`cat bleu.pf${PFTHRESHOLD}-retratos`
			echo "$PFTHRESHOLD	$BLEU" >> tuning_data_pf
		done
		
		#choose best F threshold
		BESTPF=`cat tuning_data_pf | sort -k2,2 -n -r | head -n 1 | cut -f 1`
		
		#translate and evaluate with best combination of the two thresholds
		cat $TESTSOURCE > test.src
		cat $TESTREFERENCE > test.ref
		
		cat test.src | bash $RULEGENDIR/translate_apertium.sh "" ${PAIR}-pf${BESTPF}-retratos$MODESUFFIX join "" "." > test.pf${BESTPF}-retratos
		$APERTIUMEVALOOLS/bleu.sh test.src test.ref test.pf${BESTPF}-retratos > bleu.test.pf${BESTPF}-retratos
		
		fi
		
		popd
	fi
done

popd