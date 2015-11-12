'''
Created on 21/06/2014

@author: vitaka
'''
import sys

def descToStdDesc(d):
    bigparts=d.split("__")
    resultl=[]
    for bigpart in bigparts:
        lexcat=bigpart.split(">")[0][1:]
        resultl.append(lexcat)
    return "__".join(resultl)

for line in sys.stdin:
    line=line.rstrip("\n")
    parts=line.split("\t")
    if len(parts) == 2:
        num=parts[0]
        desc=parts[1]
        stddesc=descToStdDesc(desc)
        print "\t".join([num,desc,stddesc])
