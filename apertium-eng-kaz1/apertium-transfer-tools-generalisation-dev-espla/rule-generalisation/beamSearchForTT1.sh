#shflags
MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

. $CURDIR/shflags

DEFINE_string 'target_language' 'ca' 'target language' 't'
DEFINE_string 'ats_file' '' 'file containing the alignment templates' 'f'
DEFINE_string 'sentences' '' 'file contining the sentences to be evaluated' 's'
DEFINE_string 'dir' '' 'directory where the new files and dirs will be created' 'd'
DEFINE_string 'tag_groups_seqs_suffix' '' 'tag groups and sequences suffix' 'g'
DEFINE_string 'apertium_data_dir' '' 'apertium data dir' 'u'
DEFINE_boolean 'debug' 'false' 'Debug information' 'b'
DEFINE_string 'python_home' '' 'dir of python interpreter' 'p'
DEFINE_string 'bilingual_dictionary' '' 'Binary bilingual dictionary file' 'B'
DEFINE_string 'step' '' 'step: 1=beam search 2=maximisation' 'S'
DEFINE_string 'result_infix' '' 'result infix' 'i'
DEFINE_string 'result_suffix' '' 'result suffix' 'x'

FLAGS "$@" || exit $?
eval set -- "${FLAGS_ARGV}"

ATS_FILE=${FLAGS_ats_file}
MYDIR=${FLAGS_dir}

BILDICTIONARY=${FLAGS_bilingual_dictionary}

RESULT_INFIX=${FLAGS_result_infix}
RESULT_SUFFIX=${FLAGS_result_suffix}

DEBUG_FLAG=""

STEP=${FLAGS_step}

if [ "${FLAGS_debug}" == "${FLAGS_TRUE}" ]; then
 DEBUG_FLAG="--debug"
fi
BOXESFLAG="--final_boxes_index $MYDIR/finalboxesindex$RESULT_SUFFIX --minimum_covered_words --allow_incompatible_rules"
BOXESFLAGSEC="--final_boxes_index $MYDIR/finalboxesindex$RESULT_SUFFIX"

BEAM_FLAG="--select_boxes_minimum --compute_key_segment_breaking_prob"
BEAM_FLAG="$BEAM_FLAG --final_boxes_index $MYDIR/finalboxesindex$RESULT_SUFFIX"

#first step, create final boxes index
mkdir -p $MYDIR

if [ "$STEP" == "" -o "$STEP" == "1" ]; then

cat $ATS_FILE | sed 's:^:1 | :' | ${FLAGS_python_home}python $CURDIR/addPosAndRestrictionsStr.py --tag_groups_file_name dummy --tag_sequences_file_name dummy --for_tt1_beam | cut -f 1 -d '|' | sed 's:^[ ]*::' | sed 's:[ ]*$::' | LC_ALL=C sort | uniq | awk '{print NR "	" $0}' > $MYDIR/finalboxesindex$RESULT_SUFFIX

#obtain tt1-style restrictions from sentences
zcat ${FLAGS_sentences} | cut -f 1 -d '|' | cut -f 1 -d '|'  | sed  's:^ *::' | sed  's_ *$__' | sed -r 's_ _\t_g' | sed -r 's:_: :g'  | apertium-apply-biling --biling $BILDICTIONARY | sed 's:/[^\t]*::g' | sed 's:^[^<\t]*:LEMMAPLACEHOLDER:' | sed 's:\t[^<\t]*:\tLEMMAPLACEHOLDER:g' | sed 's:LEMMAPLACEHOLDER<:<:g' | sed 's:LEMMAPLACEHOLDER:__EMPTYRESTRICTION__:g' | sed 's:\t: :g' > $MYDIR/sentences.tt1restrictions$RESULT_INFIX

#create sentences with tt1 restrictions
#zcat ${FLAGS_sentences} | cut -f 1,2,3 -d '|' > $MYDIR/sentences.prefix
#zcat ${FLAGS_sentences} | cut -f 5 -d '|' > $MYDIR/sentences.tllemmas
#paste -d '|' $MYDIR/sentences.prefix $MYDIR/sentences.tt1restrictions $MYDIR/sentences.tllemmas > $MYDIR/sentences.withtt1restrictions
zcat ${FLAGS_sentences} | paste -d '|' - $MYDIR/sentences.tt1restrictions$RESULT_INFIX > $MYDIR/sentences.withtt1restrictions$RESULT_INFIX

#then, do beam search
pushd $CURDIR

if  [ ! -f $MYDIR/scores.gz ]; then
cat $MYDIR/sentences.withtt1restrictions$RESULT_INFIX | ${FLAGS_python_home}python $CURDIR/beamSearch.py --target_language ${FLAGS_target_language} --alignment_templates $ATS_FILE --tag_groups_file_name $CURDIR/taggroups${FLAGS_tag_groups_seqs_suffix} --tag_sequences_file_name $CURDIR/tagsequences${FLAGS_tag_groups_seqs_suffix} --apertium_data_dir "${FLAGS_apertium_data_dir}" $BOXESFLAG $DEBUG_FLAG --beam_size 2000 --tt1_beam 2> $MYDIR/scores-debug$RESULT_INFIX$RESULT_SUFFIX | awk -F"[|][|][|]"  '{ print $1; }' | gzip > $MYDIR/scores$RESULT_INFIX$RESULT_SUFFIX.gz
fi

zcat $MYDIR/scores$RESULT_INFIX$RESULT_SUFFIX.gz | ${FLAGS_python_home}python $CURDIR/computeSupersetsOfKeySegments.py --tag_groups_file_name $CURDIR/taggroups${FLAGS_tag_groups_seqs_suffix} --tag_sequences_file_name $CURDIR/tagsequences${FLAGS_tag_groups_seqs_suffix} $BOXESFLAGSEC --alignment_templates $ATS_FILE --sentences $MYDIR/sentences.withtt1restrictions$RESULT_INFIX  --target_language ${FLAGS_target_language} --apertium_data_dir "${FLAGS_apertium_data_dir}" --tt1_beam  $DEBUG_FLAG 2>$MYDIR/supersegments-debug$RESULT_INFIX$RESULT_SUFFIX | gzip  > $MYDIR/supersegments$RESULT_INFIX$RESULT_SUFFIX.gz

popd

fi

if [ "$STEP" == "" -o "$STEP" == "2" ]; then

pushd $CURDIR

echo "Python home: ${FLAGS_python_home}"

#with supersegments and key segments, maximise score
zcat $MYDIR/scores$RESULT_SUFFIX.gz | ${FLAGS_python_home}python $CURDIR/maximiseScore.py $BEAM_FLAG --target_language ${FLAGS_target_language} --tag_groups_file_name $CURDIR/taggroups${FLAGS_tag_groups_seqs_suffix} --tag_sequences_file_name $CURDIR/tagsequences${FLAGS_tag_groups_seqs_suffix} --alignment_templates $ATS_FILE --sentences $MYDIR/sentences.withtt1restrictions$RESULT_INFIX  --supersegments_with_maximum_score  $MYDIR/supersegments$RESULT_SUFFIX.gz --apertium_data_dir "${FLAGS_apertium_data_dir}" --tt1_beam --ternary_search 4 2>  $MYDIR/rulesid$RESULT_SUFFIX-debug >  $MYDIR/rulesid$RESULT_SUFFIX

popd

fi



