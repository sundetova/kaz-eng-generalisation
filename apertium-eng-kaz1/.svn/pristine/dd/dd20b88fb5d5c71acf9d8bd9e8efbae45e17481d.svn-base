    CORPUS="akorda"
    PAIR="eng-kaz"
    SL="eng"
    TL="kaz"
    DATA="/home/apertium/apertium-testing/apertium-eng-kaz"
    LEX_TOOLS="/home/apertium/apertium-lex-tools"
    SCRIPTS="$LEX_TOOLS/scripts"
    MOSESDECODER="/home/apertium/mosesdecoder/scripts/training"
    TRAINING_LINES=19980
    if [ ! -d data.$SL-$TL ]; then
    mkdir data.$SL-$TL;
    fi
    # TAG CORPUS
    cat "$CORPUS.$PAIR.$SL" | head -n $TRAINING_LINES | apertium -d "$DATA" $SL-$TL-tagger \
    | apertium-pretransfer > data.$SL-$TL/$CORPUS.tagged.$SL;
    cat "$CORPUS.$PAIR.$TL" | head -n $TRAINING_LINES | apertium -d "$DATA" $TL-$SL-tagger \
    | apertium-pretransfer > data.$SL-$TL/$CORPUS.tagged.$TL;
    N=`wc -l $CORPUS.$PAIR.$SL | cut -d ' ' -f 1`
    # REMOVE LINES WITH NO ANALYSES
    seq 1 $TRAINING_LINES > data.$SL-$TL/$CORPUS.lines
    paste data.$SL-$TL/$CORPUS.lines data.$SL-$TL/$CORPUS.tagged.$SL data.$SL-$TL/$CORPUS.tagged.$TL | grep '<' \
    | grep -P -v '\t *\t' | grep -P -v '\t *$' | grep -P -v '^ *\t' | cut -f1 > data.$SL-$TL/$CORPUS.lines.new
    paste data.$SL-$TL/$CORPUS.lines data.$SL-$TL/$CORPUS.tagged.$SL data.$SL-$TL/$CORPUS.tagged.$TL | grep '<' \
    | grep -P -v '\t *\t' | grep -P -v '\t *$' | grep -P -v '^ *\t' | cut -f2 > data.$SL-$TL/$CORPUS.tagged.$SL.new
    paste data.$SL-$TL/$CORPUS.lines data.$SL-$TL/$CORPUS.tagged.$SL data.$SL-$TL/$CORPUS.tagged.$TL | grep '<' \
    | grep -P -v '\t *\t' | grep -P -v '\t *$' | grep -P -v '^ *\t' | cut -f3 > data.$SL-$TL/$CORPUS.tagged.$TL.new
    mv data.$SL-$TL/$CORPUS.lines.new data.$SL-$TL/$CORPUS.lines
    cat data.$SL-$TL/$CORPUS.tagged.$SL.new \
    | sed 's/ /~/g' | sed 's/\$[^\^]*/$ /g' > data.$SL-$TL/$CORPUS.tagged.$SL
    cat data.$SL-$TL/$CORPUS.tagged.$TL.new \
    | sed 's/ /~/g' | sed 's/\$[^\^]*/$ /g' > data.$SL-$TL/$CORPUS.tagged.$TL
    rm data.$SL-$TL/*.new
    # CLEAN CORPUS
    perl "$MOSESDECODER/clean-corpus-n.perl" data.$SL-$TL/$CORPUS.tagged $SL $TL "data.$SL-$TL/$CORPUS.tagged-clean" 1 40;
    # TRIM TAGS
    cat data.$SL-$TL/$CORPUS.tagged-clean.$SL | $LEX_TOOLS/multitrans $DATA/$SL-$TL.autobil.bin -p -t > data.$SL-$TL/$CORPUS.tag-trim.$SL
    cat data.$SL-$TL/$CORPUS.tagged-clean.$TL | $LEX_TOOLS/multitrans $DATA/$TL-$SL.autobil.bin -p -t > data.$SL-$TL/$CORPUS.tag-trim.$TL
    # CLEAN CORPUS AGAIN
    python3 "$SCRIPTS/strip-empty-lines.py" data.$SL-$TL/$CORPUS.tag-trim $SL $TL data.$SL-$TL/$CORPUS.tag-trim.new
    mv data.$SL-$TL/$CORPUS.tag-trim.new.$SL data.$SL-$TL/$CORPUS.tag-trim.$SL
    mv data.$SL-$TL/$CORPUS.tag-trim.new.$TL data.$SL-$TL/$CORPUS.tag-trim.$TL
