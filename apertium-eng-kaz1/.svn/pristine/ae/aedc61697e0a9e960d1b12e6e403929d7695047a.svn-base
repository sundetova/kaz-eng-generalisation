#!/bin/bash

C=2
GREP='.'
if [ $# -ne 2 ] 
then
  echo "Usage: ./new-regression-tests eng kaz" 
  echo "or"
  echo "       ./new-regression-tests kaz eng"
  exit
fi

bash wiki-tests.sh Regression $1 $2 update | grep -C $C "$GREP"


