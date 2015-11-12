#!/bin/bash

C=2
GREP='.'
if [ $# -eq 1 ]
then
    C=$1
    GREP='WORKS'
fi

bash wiki-tests.sh Regression eng kaz update | grep -C $C "$GREP"

bash wiki-tests.sh Regression kaz eng update | grep -C $C "$GREP"

