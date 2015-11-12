     CORPUS="akorda"
    PAIR="eng-kaz"
    SL="eng"
    TL="kaz"
    DATA="/home/apertium/apertim-testing/apertium-eng-kaz"
    LM=/tmp/test.lm
    LEX_TOOLS="/home/apertium/apertium-lex-tools"
    SCRIPTS="$LEX_TOOLS/scripts"
    MOSESDECODER="/home/apertium/mosesdecoder/scripts/training"
    BIN_DIR="/usr/local/bin"
    # FAKE AN LM
    echo -e "1\n2\n3" > $LM
    # ALIGN
    perl $MOSESDECODER/train-model.perl -mgiza -external-bin-dir "$BIN_DIR" -corpus data.$SL-$TL/$CORPUS.tag-trim \
    -f $TL -e $SL -alignment grow-diag-final-and -reordering msd-bidirectional-fe \
    -lm 0:5:$LM:0 2>&1
    # EXTRACT
    zcat giza.$SL-$TL/$SL-$TL.A3.final.gz | $SCRIPTS/giza-to-moses.awk | sed 's/|||/\t/g' | cut -f1,2 > data.$SL-$TL/$CORPUS.phrases.$SL-$TL
    paste data.$SL-$TL/$CORPUS.phrases.$SL-$TL model/aligned.grow-diag-final-and | sed 's/\t/|||/g' > data.$SL-$TL/$CORPUS.phrasetable.$SL-$TL
    cat data.$SL-$TL/$CORPUS.phrasetable.$SL-$TL | sed 's/|||/\t/g' | cut -f2 | sed 's/~/ /g' | $LEX_TOOLS/multitrans $DATA/$SL-$TL.autobil.bin -b | lrx-proc -m data.$SL-$TL/global-defaults.$SL-$TL.bin > data.$SL-$TL/$CORPUS.clean-biltrans.$SL-$TL
    # SENTENCES
    python3 $SCRIPTS/extract-sentences.py data.$SL-$TL/$CORPUS.phrasetable.$SL-$TL data.$SL-$TL/$CORPUS.clean-biltrans.$SL-$TL \
    > data.$SL-$TL/$CORPUS.candidates.$SL-$TL 2>/dev/null
    # EXTRACT TEST, DEVEL and TRAINING CORPORA
    if [ ! -d final.$SL-$TL ]; then
    mkdir -p final.$SL-$TL
    fi
    # FREQUENCY LEXICON
    python3 $SCRIPTS/extract-freq-lexicon.py data.$SL-$TL/$CORPUS.candidates.$SL-$TL > data.$SL-$TL/$CORPUS.lex.$SL-$TL 2>/tmp/freq-log
