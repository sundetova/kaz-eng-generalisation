DIX=/home/apertium/apertium-testing/apertium-kaz/apertium-kaz.kaz.lexc
BIN=/home/apertium/apertium-testing/apertium-eng-kaz/kaz-eng.automorf.bin
cat /home/apertium/apertium-testing/apertium-eng-kaz/texts/hanzada.kaz.txt | cut -f2 | grep -v '>(' | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | apertium-destxt | lt-proc -w $BIN | apertium-retxt | sed 's/\$\W*\^/$\n^/g' > /tmp/kaz.coverage.txt

EDICT=`cat $DIX | grep ':' | wc -l`;
EPAR=`cat $DIX | grep ':' | wc -l`;
TOTAL=`cat /tmp/kaz.coverage.txt | wc -l`
KNOWN=`cat /tmp/kaz.coverage.txt | grep -v '*' | wc -l`
COV=`calc $KNOWN / $TOTAL`;
DATE=`date`;

echo -e $DATE"\t"$EPAR":"$EDICT"\t"$KNOWN"/"$TOTAL"\t"$COV >> history.log
tail -1 history.log
