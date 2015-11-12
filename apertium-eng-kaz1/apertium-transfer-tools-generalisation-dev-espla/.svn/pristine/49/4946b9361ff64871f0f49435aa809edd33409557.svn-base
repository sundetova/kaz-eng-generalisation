from beamSearchLib import ParallelSentence
import sys, ruleLearningLib, argparse,gzip,re

ENCODING='utf-8'

if __name__=="__main__":
    for line in sys.stdin:
        line=line.rstrip("\n")
        pairsOfTags=[]
        for matchptags in re.finditer(r"<s n=\"([a-zA-Z0-9]*(\|[A-Za-z0-9]*)+)\"/>",line):
            pairsOfTags.append((matchptags.start(1),matchptags.end(1)))
        pairsParts=[]
        for pair in pairsOfTags:
            chunk=line[pair[0]:pair[1]]
            pairsParts.append(chunk.split("|"))
        if len(pairsParts) > 0:
            variants=[]
            length=len(pairsParts[0])
            for i in range(length):
                variants.append([])
            prev=0
            for j,alttags in enumerate(pairsParts):
                start,end = pairsOfTags[j]
                for i in range(length):
                    variants[i].append(line[prev:start])
                    variants[i].append(alttags[i])
                prev=end
            for i in range(length):
                variants[i].append(line[prev:])
            for variantl in variants:
                print "".join(variantl)
        else:
            print line
        
