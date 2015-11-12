#! /bin/bash

#shflags
MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

. $CURDIR/shflags

DEFINE_string 'source_language' 'es' 'source language' 'S'
DEFINE_string 'target_language' 'ca' 'target language' 't'
DEFINE_string 'ats_file' '' 'file containing the alignment templates' 'f'
DEFINE_string 'bilingual_phrases_file' '' 'file containing the bilingual phrases' 'P'
DEFINE_string 'dir' '' 'directory where the new files and dirs will be created' 'd'
DEFINE_string 'tag_groups_seqs_suffix' '' 'tag groups and sequences suffix' 'g'
DEFINE_string 'apertium_prefix' '' 'apertium prefix' 'x'
DEFINE_boolean 'debug' 'false' 'Debug information' 'b'
DEFINE_string 'python_home' '' 'dir of python interpreter' 'p'
DEFINE_string 'bilingual_dictionary' '' 'Binary bilingual dictionary file' 'B'
DEFINE_string 'finalboxesindex_beamsearch' '' 'final boxes index used in maximisation after beam search' 'F'
DEFINE_string 'boxesid_beamsearch' '' 'allowed boxes after beam search' 'e'

FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"

MYDIR=${FLAGS_dir}
BILPHRASES_FILE=${FLAGS_bilingual_phrases_file}
BILDICTIONARY=${FLAGS_bilingual_dictionary}
ATS=${FLAGS_ats_file}

SL=${FLAGS_source_language}
TL=${FLAGS_target_language}

PYTHONHOME="${FLAGS_python_home}"
APERTIUM_PREFIX="${FLAGS_apertium_prefix}"

mkdir -p $MYDIR
#put bilingual phrases in their most adequate format
zcat $BILPHRASES_FILE | sed 's:^[^|]*| ::' | LC_ALL=C sort | LC_ALL=C uniq | sed 's:\^\$:^*unknown$:g'  | sed 's:\^:| ^:'   |  sed 's:| *\^:| ':g | sed 's:\$ *|: |:g' | sed 's:\$ *\^: :g' | sed 's:^| ::' | grep -v '\*' | gzip > $MYDIR/bilphrases.step1.gz

zcat $MYDIR/bilphrases.step1.gz | cut -f 1 -d '|'  | sed  's:^ *::' | sed  's_ *$__' | sed -r 's_ _\t_g' | sed -r 's:_: :g'  | apertium-apply-biling --biling $BILDICTIONARY --withqueue | sed 's:/[^\t]*::g' | gzip > $MYDIR/bilphrases.bildictionary.gz
zcat $MYDIR/bilphrases.step1.gz | cut -f 1 -d '|'  | sed  's:^ *::' | sed  's_ *$__' | sed -r 's_ _\t_g' | sed -r 's:_: :g'  | apertium-apply-biling --biling $BILDICTIONARY | sed 's:/[^\t]*::g' | gzip > $MYDIR/bilphrases.bildictionary_tt1.gz
zcat $MYDIR/bilphrases.bildictionary.gz  | sed 's:<[^\t]*::g' | sed 's: :_:g' | sed 's:\t: :g' > $MYDIR/bilphrases.tllemmas

zcat $MYDIR/bilphrases.bildictionary.gz  | sed 's:^[^<\t]*:LEMMAPLACEHOLDER:' | sed 's:\t[^<\t]*:\tLEMMAPLACEHOLDER:g' | sed 's:LEMMAPLACEHOLDER<:<:g' | sed 's:LEMMAPLACEHOLDER:__EMPTYRESTRICTION__:g' | sed 's:\t: :g' > $MYDIR/bilphrases.restrictions

zcat $MYDIR/bilphrases.bildictionary_tt1.gz  | sed 's:^[^<\t]*:LEMMAPLACEHOLDER:' | sed 's:\t[^<\t]*:\tLEMMAPLACEHOLDER:g' | sed 's:LEMMAPLACEHOLDER<:<:g' | sed 's:LEMMAPLACEHOLDER:__EMPTYRESTRICTION__:g' | sed 's:\t: :g' > $MYDIR/bilphrases.restrictions_tt1

zcat $MYDIR/bilphrases.step1.gz | paste -d '|' - $MYDIR/bilphrases.restrictions $MYDIR/bilphrases.tllemmas $MYDIR/bilphrases.restrictions_tt1 | gzip > $MYDIR/bilphrases.gz

PROCESSED_BILPHRASES=$MYDIR/bilphrases.gz

#filter ATs if necessary
if [ "${FLAGS_boxesid_beamsearch}" != "" ]; then
	MYATS=$MYDIR/filteredats
	#get sequences of categories
	cat ${FLAGS_boxesid_beamsearch} |  LC_ALL=C sort  > $MYDIR/boxesbeamsearch.sorted
	cat ${FLAGS_finalboxesindex_beamsearch} | LC_ALL=C sort -k1,1 -t '	' > $MYDIR/finalboxesbeamsearch.sorted
	LC_ALL=C join -t '	' $MYDIR/boxesbeamsearch.sorted $MYDIR/finalboxesbeamsearch.sorted | cut -f 2 > $MYDIR/allowedboxes
	${PYTHONHOME}python $CURDIR/filterTT1WithBoxes.py --allowed_boxes $MYDIR/allowedboxes < $ATS > $MYATS
else
	MYATS=$ATS
fi


#zcat $PROCESSED_BILPHRASES | sed 's:^:1 | :' | python $CURDIR/addPosAndRestrictionsStr.py --tag_groups_file_name dummy --tag_sequences_file_name dummy --for_tt1_beam | cut -f 1 -d '|' | sed 's:^[ ]*::' | sed 's:[ ]*$::' | LC_ALL=C sort | uniq | awk '{print NR "	" $0}' > $MYDIR/finalboxesindex

#we need to split bilingual phrases in boxes
mkdir -p $MYDIR/newbilphrases

zcat $PROCESSED_BILPHRASES | sed 's:^:1 | :' | ${PYTHONHOME}python $CURDIR/addPosAndRestrictionsStr.py --tag_groups_file_name  dummy --tag_sequences_file_name  dummy --for_tt1_beam | sed 's_ |_|_' | LC_ALL=C sort | ${PYTHONHOME}python $CURDIR/spreadBilphrases.py  > $MYDIR/finalboxesindex

zcat $PROCESSED_BILPHRASES | sed 's:^:1 | :' | ${PYTHONHOME}python $CURDIR/addPosAndRestrictionsStr.py --tag_groups_file_name  dummy --tag_sequences_file_name  dummy --for_tt1_beam | sed 's_ |_|_' | LC_ALL=C sort | ${PYTHONHOME}python $CURDIR/spreadBilphrases.py --dir $MYDIR --dict $MYDIR/finalboxesindex --tt1_beam

#and also get the boxes of the rules

#now split rules in boxes and sort them from shorter to longer
mkdir -p $MYDIR/reorderrules/newbilphrases
cat $MYATS | sed 's:^:1 | :' | ${PYTHONHOME}python $CURDIR/addPosAndRestrictionsStr.py --tag_groups_file_name  dummy --tag_sequences_file_name  dummy --for_tt1_beam  | sed 's_ |_|_' |  ${PYTHONHOME}python $CURDIR/spreadBilphrases.py --dir $MYDIR/reorderrules --dict $MYDIR/finalboxesindex --tt1_beam --input_not_sorted
cat $MYDIR/finalboxesindex |  grep -v "^$"  | awk  '{split($2,splitted,"__"); print $1 "\t" $2 "\t" length(splitted)}' | sort -n -k3,3 | awk '{print $1}' > $MYDIR/sortedboxesindex

rm -f $MYDIR/ats

while read BOX ; do
	if [ -f "$MYDIR/reorderrules/newbilphrases/$BOX.bilphrases" ]; then
		cat $MYDIR/reorderrules/newbilphrases/$BOX.bilphrases >> $MYDIR/ats
	fi
done < $MYDIR/sortedboxesindex


#And now we can almost run the removal of redundant rules

#APERTIUM_PREFIX??? OK
#RICHATSFLAG??
#APERTIUM_SOURCES??
#ORIGINAL_TRAINING_CORPUS??


#remove shadowed rules: rules with same SL side and restrictions than a previous rule
mkdir -p $MYDIR/subrules/default
cat $MYDIR/ats | sed 's:^ [0-9]* | ::' | ${PYTHONHOME}python -c '
import sys
seentuples=set()
for line in sys.stdin:
	line=line.rstrip("\n").decode("utf-8")
	parts=line.split(u"|")
	slpart=parts[0].strip()
	restrictions=parts[3].strip()
	mytuple=(slpart,restrictions)
	if not mytuple in seentuples:
		print line.encode("utf-8")
	seentuples.add(mytuple)
'> $MYDIR/atswithoutshadowing

cat $MYDIR/atswithoutshadowing | sed 's:^:1 | :' | ${PYTHONHOME}python $CURDIR/addPosAndRestrictionsStr.py --tag_groups_file_name  dummy --tag_sequences_file_name  dummy --for_tt1_beam  --print_box_index_from_dict $MYDIR/finalboxesindex > $MYDIR/boxes

cat $MYDIR/atswithoutshadowing > $MYDIR/subrules/default/initialrules

bash $CURDIR/removeRedundantRules.sh $MYDIR/subrules/default/initialrules  $MYDIR/boxes "$CURDIR" "$SL" "$TL" "$APERTIUM_PREFIX" "${FLAGS_tag_groups_seqs_suffix}" "$MYDIR/newbilphrases" ".bilphrases.gz" "$BILDICTIONARY" "${PYTHONHOME}" "tt1" "" "" "keep" ""

rm $MYDIR/bilphrases*
cp $MYDIR/subrules/default/initialrules.reduced.gz $MYDIR/
cp $MYDIR/subrules/default/summary.*gz $MYDIR/
rm -R $MYDIR/subrules/default
rm -R $MYDIR/newbilphrases $MYDIR/reorderrules

