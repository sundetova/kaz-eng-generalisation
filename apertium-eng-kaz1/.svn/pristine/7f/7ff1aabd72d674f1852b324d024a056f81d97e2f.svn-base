PAIR="eng-kaz"
    SL="eng"
    TL="kaz"
    DATA="/home/apertium/apertium-testing/apertium-eng-kaz"
    LEX_TOOLS="/home/apertium/apertium-lex-tools"
    OPENCATS="n vblex adj"
    # generate the bilingual dictionaries
    # generate the default lexical selection rules for unwanted categories
    lt-comp lr $DATA/apertium-$PAIR.$PAIR.dix $DATA/$SL-$TL.autobil.ambig.bin
    pushd $DATA
    make $SL-$TL.autobil.bin
    popd
    DICT=""
    if [ -e $DATA/.deps/en.dix ] ; then
    DICT=$DATA/.deps/en.dix
    else
    DICT=$DATA/apertium-$PAIR.$SL.dix
    fi
    lt-expand $DICT | grep -v 'REGEX' | sed 's/:[><]:/:/g' | cut -f2 -d':' | sed 's/^/^/g' | sed 's/$/$/g' | $LEX_TOOLS/multitrans $DATA/$SL-$TL.autobil.ambig.bin -b -t > /tmp/$SL-$TL.exp.ambig
    lt-expand $DICT | grep -v 'REGEX' | sed 's/:[><]:/:/g' | cut -f2 -d':' | sed 's/^/^/g' | sed 's/$/$/g' | $LEX_TOOLS/multitrans $DATA/$SL-$TL.autobil.bin -b -t | lrx-proc -m $DATA/$SL-$TL.lrx.bin > /tmp/$SL-$TL.exp.unambig
    GREPFOR=""
    for cat in `echo $OPENCATS | tr ' ' '\n'`; do
    GREPFOR="$GREPFOR -e <$cat>";
    done
    echo -- $GREPFOR
    if [ ! -d data.$SL-$TL ] ; then
    mkdir -p data.$SL-$TL
    fi
    paste /tmp/$SL-$TL.exp.ambig /tmp/$SL-$TL.exp.unambig | grep '\/.*\/.*\/' | grep -v $GREPFOR | sort -u | python3 $LEX_TOOLS/scripts/expand-to-lrx.py > data.$SL-$TL/global-defaults.$SL-$TL.lrx
    lrx-comp data.$SL-$TL/global-defaults.$SL-$TL.lrx data.$SL-$TL/global-defaults.$SL-$TL.bin
   
   
