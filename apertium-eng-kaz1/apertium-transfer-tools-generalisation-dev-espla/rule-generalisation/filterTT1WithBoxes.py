import argparse
import ruleLearningLib
import sys,gzip,math

ENCODING='utf-8'

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Filter TT1 alignment templates and keep only those with the lexical categories from a TT2.0 solution')
    parser.add_argument('--allowed_boxes')
    args = parser.parse_args(sys.argv[1:])
    
    allowedseqs=set()
    for line in open(args.allowed_boxes):
        line=line.decode(ENCODING).strip()
        cats=line.split(u"__")
        allowedseqs.add(tuple(cats))
    
    for line in sys.stdin:
        line=line.decode(ENCODING).strip()
        at = ruleLearningLib.AlignmentTemplate()
        at.parse(line)
        slseq=tuple([ l.get_pos() for l in at.parsed_sl_lexforms ])
        if slseq in allowedseqs:
            print line.encode(ENCODING)
