from beamSearchLib import ParallelSentence
import sys, ruleLearningLib, argparse,gzip

ENCODING='utf-8'

if __name__=="__main__":
    parser = argparse.ArgumentParser(description='Extracts bilingual phrases.')
    parser.add_argument('--sentences')
    parser.add_argument('--output_sl')
    parser.add_argument('--output_tl')
    parser.add_argument('--output_dic_header')
    args = parser.parse_args(sys.argv[1:])
    
    outsl=open(args.output_sl,'w')
    outtl=open(args.output_tl,'w')
    
    tagset=set()
    
    for line in gzip.open(args.sentences):
        line=line.rstrip('\n').decode(ENCODING)
        #parts=line.split(u" | ")
        parallelSentence=ParallelSentence()
        #parallelSentence.parse(u" | ".join(parts[1:]), parseTlLemmasFromDic=False)
        parallelSentence.parse(line, parseTlLemmasFromDic=True)
        retratos_s,retratos_t = parallelSentence.to_retratos_format()
        
        for lf in parallelSentence.parsed_sl_lexforms+parallelSentence.parsed_tl_lexforms:
            if not lf.is_unknown():
                tagset.add(lf.get_pos())
                for tag in lf.get_tags():
                    subtags=tag.split(u"|")
                    for st in subtags:
                        tagset.add(st)
        
        outsl.write(retratos_s.encode(ENCODING)+"\n")
        outtl.write(retratos_t.encode(ENCODING)+"\n")
    
    if args.output_dic_header:
        outheader=open(args.output_dic_header,'w')
        outheader.write(u"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<dictionary><alphabet/><sdefs>\n".encode('utf-8'))
        for tag in tagset:
            outheader.write((u"<sdef n=\""+tag+u"\"/>\n").encode('utf-8'))
        outheader.write("</sdefs><section id=\"main\" type=\"standard\">".encode('utf-8'))
        
        