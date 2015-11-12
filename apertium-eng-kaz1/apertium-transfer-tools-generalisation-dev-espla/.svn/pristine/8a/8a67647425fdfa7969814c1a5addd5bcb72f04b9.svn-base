import argparse
import ruleLearningLib
import sys,gzip,math

ENCODING='utf-8'

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Filter TT1 alignment templates and keep only those with the lexical categories from a TT2.0 solution')
    parser.add_argument('--tt1_ats')
    parser.add_argument('--tt2_ats')
    args = parser.parse_args(sys.argv[1:])
    
    allowedseqs=set()
    for line in gzip.open(args.tt2_ats):
        line=line.decode(ENCODING).strip()
        at = ruleLearningLib.AlignmentTemplate()
        at.parse(line)
        slseq=tuple([ l.get_pos() for l in at.parsed_sl_lexforms ])
        allowedseqs.add(slseq)
    
    for line in gzip.open(args.tt1_ats):
        line=line.decode(ENCODING).strip()
        at = ruleLearningLib.AlignmentTemplate()
        parts=line.split(u"|")
        at.parse(u"|".join(parts[1:]))
        slseq=tuple([ l.get_pos() for l in at.parsed_sl_lexforms ])
        if slseq in allowedseqs:
            print line.encode(ENCODING)
