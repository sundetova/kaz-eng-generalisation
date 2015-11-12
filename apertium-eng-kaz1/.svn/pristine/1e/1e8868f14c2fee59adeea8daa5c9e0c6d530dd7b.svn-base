#!/bin/bash

C=2
GREP='.'
if [ $# -eq 1 ]
then
    C=$1
    GREP='WORKS'
fi

bash wiki-correct-tests.sh Regression eng kaz update | grep -C $C "$GREP"

#sh wiki-correct-tests.sh Regression kaz eng update | grep -C $C "$GREP"

