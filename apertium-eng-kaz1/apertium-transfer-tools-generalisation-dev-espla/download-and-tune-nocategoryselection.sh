#! /bin/bash

MYFULLPATH=`readlink -f $0`
CURDIR=`dirname $MYFULLPATH`

SL=$1
TL=$2

DEV_CORPUS=$3
TEST_CORPUS=$4

CLUSTER_DIR=$5
MY_TMPDIR=$6

INVERSE_PAIR=$7

PAR_THRESHOLDS=$8


SOURCESDIR=/home/vmsanchez/hybridmt/tools/
 APERTIUMPREFIX=/home/vmsanchez/rulesinteractive/local
 FILTERING_NAME=proportion_correct_bilphrases_thresholdextendedrangerelaxdynamic1000above2
 PAIR="$SL-$TL"
 
 if [ "$PAR_THRESHOLDS" != "" ]; then
  THRESHOLD_START=`echo "$PAR_THRESHOLDS" | cut -f 1 -d ' '`
  THRESHOLD_STEP=`echo "$PAR_THRESHOLDS" | cut -f 2 -d ' '`
  THRESHOLD_END=`echo "$PAR_THRESHOLDS" | cut -f 3 -d ' '`
 else
  THRESHOLD_START=0.2
  THRESHOLD_STEP=0.05
  THRESHOLD_END=1
 fi

 if [ "$#" != "6" -a "$#" != "7" -a "$#" != "8" ]; then
 echo "USAGE:$0 SL TL DEV_CORPUS TEST_CORPUS CLUSTER_DIR MY_TMPDIR"
 exit 1
 fi
 
 
 if [ ! -d $MY_TMPDIR/filtering-$FILTERING_NAME ] ; then
 
 #download all the filtering files
 mkdir -p $MY_TMPDIR
 scp euler.iuii.ua.es:$CLUSTER_DIR/filtering-*.tar.gz $MY_TMPDIR/
 
 #unzip all the files
 pushd $MY_TMPDIR
 for FILE in *.tar.gz ; do
 	tar xzf $FILE
 done
 popd
 
 fi
 
 if [ "$INVERSE_PAIR" != "" ]; then
 	INVERSE_PAIR_TUNING_FLAG="-i"
 fi
 
 #TODO: use fixed bildictionary
 
 #Now run the tuning script WITHOUT subrules
 bash $CURDIR/rule-generalisation/tune-experiment-linear-incremental-parallel-v8.sh -f $SOURCESDIR -p $APERTIUMPREFIX -s $SL -t $TL  -d $MY_TMPDIR -c "$DEV_CORPUS" -e "$TEST_CORPUS" -r $THRESHOLD_START -a $THRESHOLD_STEP -b $THRESHOLD_END -o $FILTERING_NAME -x "_$PAIR" $INVERSE_PAIR_TUNING_FLAG -l -R -F
  