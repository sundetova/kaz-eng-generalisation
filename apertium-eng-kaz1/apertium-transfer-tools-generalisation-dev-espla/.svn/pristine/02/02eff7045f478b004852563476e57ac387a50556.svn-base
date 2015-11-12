#! /bin/bash

ORIGINAL_MODE=$1
TRANSFER_TOOLS_PATH=$2
LEARNED_RULES=$3
POSTRANSFER_FILE=$4
BIN_BIDICTIONARY=$5
ADDITIONAL_TRANSFER_OPERATIONS=$6
ADDITIONAL_TRANSFER_OPERATIONS_BEFORE=$7
MODE_TYPE=$8

MODE_FOR_RBPE_GENERATION=$9

if [ "" == "$ADDITIONAL_TRANSFER_OPERATIONS"  ]; then

ADDITIONAL_TRANSFER_OPERATIONS="cat -"

fi

if [ "" == "$ADDITIONAL_TRANSFER_OPERATIONS_BEFORE"  ]; then

ADDITIONAL_TRANSFER_OPERATIONS_BEFORE="cat -"

fi

SLASHTRANSFERTOOLS="/"
if [ "" == "$TRANSFER_TOOLS_PATH"  ]; then 
	SLASHTRANSFERTOOLS=""
fi

if [ "" == "$BIN_BIDICTIONARY" ]; then
	BIN_BIDICTIONARY=`cat $ORIGINAL_MODE | awk -F"apertium-transfer" '{print $NF}' | awk -F"|" '{print $1}' | awk -F" " '{print $3}' | tr -d '\n'`
fi

TOPRETRANSFER=`cat $ORIGINAL_MODE | awk -F"apertium-pretransfer" '{ print $1 }' | tr -d '\n' | sed 's_ *$__'`
FROMPRETRANSFER=`cat $ORIGINAL_MODE | awk -F"apertium-pretransfer" '{ print $2 }' | tr -d '\n'`

FROMTRANSFER=`cat $ORIGINAL_MODE | awk  '{print substr($0,index($0,"apertium-transfer")) }' | sed 's:^apertium-transfer::' | tr -d '\n'`

if [[ $(cat $ORIGINAL_MODE | tr '\n' ' ') == *"hfst-proc"* ]]; then
  FROMSECONDLTPROC=`cat $ORIGINAL_MODE | sed 's/.*hfst-proc/hfst-proc/g' | tr -d '\n'`
else
  FROMSECONDLTPROC=`echo $FROMTRANSFER |  grep -o 'lt-proc.*$'  | tr -d '\n'` #awk -F"lt-proc" '{ print $2 }' | tr -d '\n'
fi

if  [[ $(cat $ORIGINAL_MODE | tr '\n' ' ') == *"apertium-interchunk"* ]]; then
  INTERCHUNK=`cat $ORIGINAL_MODE | sed 's/|/|\n/g' | egrep "apertium-interchunk"  | tr '\n' ' ' | sed 's/|\s*$/ /g'`
else
  INTERCHUNK="cat -"
fi

if  [[ $(cat $ORIGINAL_MODE | tr '\n' ' ') == *"apertium-postchunk"* ]]; then
  POSTCHUNK=`cat $ORIGINAL_MODE | sed 's/.*\(apertium-postchunk[^|]*\)|.*/\1/g'`
else
  POSTCHUNK="cat -"
fi

if  [[ $(cat $ORIGINAL_MODE | tr '\n' ' ') == *"apertium-transfer -n"* ]]; then
  #TRANSFFER4=`cat $ORIGINAL_MODE | sed 's/.*\(apertium-transfer -n[^|]*\)|.*/\1/g'`
  TRANSFFER4=`cat $ORIGINAL_MODE | sed 's/.*\(apertium-transfer -n[^|]*\)|.*/\1/g'`
else
  TRANSFFER4="cat -"
fi

APERTIUM_PATH=`echo $TOPRETRANSFER | awk -F"lt-proc" '{ print $1 }' | tr -d '\n'`

if [ "$MODE_FOR_RBPE_GENERATION" != "" ]; then
 FROMTRANSFERRBPE=`cat $MODE_FOR_RBPE_GENERATION | awk  '{print substr($0,index($0,"apertium-transfer")) }' | sed 's:^apertium-transfer::' | tr -d '\n'`
 FROMSECONDLTPROC=`echo $FROMTRANSFERRBPE |  grep -o 'lt-proc.*$'  | tr -d '\n'`
fi

if [ "$MODE_TYPE" == "old" ]; then
  #echo "${TOPRETRANSFER}apertium-pretransfer  | $ADDITIONAL_TRANSFER_OPERATIONS_BEFORE | ${APERTIUM_PATH}apertium-transfer ${LEARNED_RULES}.xml ${LEARNED_RULES}.bin $BIN_BIDICTIONARY | sed 's_\^\([^#$]*\)[#]\([^<$]*\)\(<[^\$]*\)\\\$_^\\1\\3#\\2\$_g' | $ADDITIONAL_TRANSFER_OPERATIONS | ${POSTCHUNK} | ${TRANSFER_TOOLS_PATH}${SLASHTRANSFERTOOLS}apertium-posttransfer -x  ${POSTRANSFER_FILE} | ${APERTIUM_PATH}${FROMSECONDLTPROC}" | tr '\n' ' '
  echo "${TOPRETRANSFER}apertium-pretransfer  | $ADDITIONAL_TRANSFER_OPERATIONS_BEFORE | ${APERTIUM_PATH}apertium-transfer ${LEARNED_RULES}.xml ${LEARNED_RULES}.bin $BIN_BIDICTIONARY | $ADDITIONAL_TRANSFER_OPERATIONS | ${INTERCHUNK} | ${POSTCHUNK} | ${TRANSFFER4} | sed 's_\^\([^#$]*\)[#]\([^<$]*\)\(<[^\$]*\)\\\$_^\\1\\3#\\2\$_g' | ${TRANSFER_TOOLS_PATH}${SLASHTRANSFERTOOLS}apertium-posttransfer -x  ${POSTRANSFER_FILE} | ${APERTIUM_PATH}${FROMSECONDLTPROC}" | tr '\n' ' '
else
  #echo "${TOPRETRANSFER}apertium-pretransfer |  lt-proc -b $BIN_BIDICTIONARY | $ADDITIONAL_TRANSFER_OPERATIONS_BEFORE | ${APERTIUM_PATH}apertium-transfer -b ${LEARNED_RULES}.xml ${LEARNED_RULES}.bin | sed 's_\^\([^#$]*\)[#]\([^<$]*\)\(<[^\$]*\)\\\$_^\\1\\3#\\2\$_g' | $ADDITIONAL_TRANSFER_OPERATIONS | ${TRANSFER_TOOLS_PATH}${SLASHTRANSFERTOOLS}apertium-posttransfer -x  ${POSTRANSFER_FILE} | ${APERTIUM_PATH}${FROMSECONDLTPROC}"
if [ "cat -" == "$ADDITIONAL_TRANSFER_OPERATIONS_BEFORE"  ]; then
  echo "${TOPRETRANSFER}apertium-pretransfer |  lt-proc -b $BIN_BIDICTIONARY | $ADDITIONAL_TRANSFER_OPERATIONS_BEFORE | ${APERTIUM_PATH}apertium-transfer -b ${LEARNED_RULES}.xml ${LEARNED_RULES}.bin | $ADDITIONAL_TRANSFER_OPERATIONS | sed 's_\^\([^#$]*\)[#]\([^<$]*\)\(<[^\$]*\)\\\$_^\\1\\3#\\2\$_g' | ${TRANSFER_TOOLS_PATH}${SLASHTRANSFERTOOLS}apertium-posttransfer -x  ${POSTRANSFER_FILE} | ${APERTIUM_PATH}${FROMSECONDLTPROC}" | tr '\n' ' '
else
  echo "${TOPRETRANSFER}apertium-pretransfer |  lt-proc -b $BIN_BIDICTIONARY | $ADDITIONAL_TRANSFER_OPERATIONS_BEFORE | ${APERTIUM_PATH}apertium-transfer -b ${LEARNED_RULES}.xml ${LEARNED_RULES}.bin | $ADDITIONAL_TRANSFER_OPERATIONS | ${INTERCHUNK} | ${POSTCHUNK} | ${TRANSFFER4} | sed 's_\^\([^#$]*\)[#]\([^<$]*\)\(<[^\$]*\)\\\$_^\\1\\3#\\2\$_g' | ${TRANSFER_TOOLS_PATH}${SLASHTRANSFERTOOLS}apertium-posttransfer -x  ${POSTRANSFER_FILE} | ${APERTIUM_PATH}${FROMSECONDLTPROC}" | tr '\n' ' '
fi
fi
