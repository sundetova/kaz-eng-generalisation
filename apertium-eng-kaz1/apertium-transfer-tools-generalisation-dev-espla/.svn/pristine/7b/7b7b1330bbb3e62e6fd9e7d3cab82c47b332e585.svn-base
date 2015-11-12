#!/usr/bin/python
# coding=utf-8
# -*- encoding: utf-8 -*-

import sys, ruleLearningLib, argparse,gzip, codecs,operator

ENCODING='utf-8'

def gen_xml_head(lexcats):
    head=U""
    head+=u"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    head+=u"<!-- -*- nxml -*- -->\n"
    head+=u"<transfer>\n"
    head+=u"<section-def-cats>\n"
    for c in lexcats:
        head+=u"  <def-cat n=\"CAT__"+c+u"\">\n"
        head+=u"  <cat-item tags=\""+c+u"\"/>\n"
        head+=u"  <cat-item tags=\""+c+u".*\"/>\n"
        head+=u"  </def-cat>\n"
    head+=u"<def-cat n=\"CAT__HASGENDER_NUMBER\"><cat-item tags=\"*.m.*\"/><cat-item tags=\"*.f.*\"/><cat-item tags=\"*.sg.*\"/><cat-item tags=\"*.pl.*\"/></def-cat>"
    head+=u"  <def-cat n=\"CAT__ND_GD\">\n"
    head+=u"    <cat-item tags=\"*.mf.*\"/>\n"
    head+=u"    <cat-item tags=\"*.sp.*\"/>\n"
    head+=u"    <cat-item tags=\"*.mf.sp.*\"/>\n"
    head+=u"    <cat-item tags=\"*.sp.mf.*\"/>\n"
    head+=u"    <cat-item tags=\"*.mf.*.sp.*\"/>\n"
    head+=u"    <cat-item tags=\"*.sp.*.mf.*\"/>\n"
    head+=u"  </def-cat>\n"
    head+=u"  <def-cat n=\"sent\">\n"
    head+=u"    <cat-item tags=\"sent\"/>\n"
    head+=u"  </def-cat>\n"
    head+=u"  <def-cat n=\"any\">\n"
    head+=u"    <cat-item tags=\"*\"/>\n"
    head+=u"  </def-cat>\n"
    head+=u"</section-def-cats>\n"
    head+=u""
    head+=u""
    head+=u"<section-def-attrs>\n"
    head+=u"  <def-attr n=\"learned_gen\">\n"
    head+=u"    <attr-item tags=\"m\"/>\n"
    head+=u"    <attr-item tags=\"f\"/>\n"
    head+=u"    <attr-item tags=\"mf\"/>\n"
    head+=u"    <attr-item tags=\"GD\"/>\n"
    head+=u"  </def-attr>\n"
    head+=u"  <def-attr n=\"learned_num\">\n"
    head+=u"    <attr-item tags=\"sg\"/>\n"
    head+=u"    <attr-item tags=\"pl\"/>\n"
    head+=u"    <attr-item tags=\"sp\"/>\n"
    head+=u"    <attr-item tags=\"ND\"/>\n"
    head+=u"  </def-attr>\n"
    head+=u"</section-def-attrs>\n"
    head+=u""
    head+=u"<section-def-vars>\n"
    head+=u"  <def-var n=\"genre\"/>\n"
    head+=u"  <def-var n=\"number\"/>\n"
    head+=u"</section-def-vars>\n"
    head+=u""
    head+=u"<section-def-macros>\n"
    head+=u"<def-macro n=\"f_bcond\" npar=\"2\">\n"
    head+=u"  <choose>\n"
    head+=u"    <when>\n"
    head+=u"      <test>\n"
    head+=u"        <not>\n"
    head+=u"     <equal>\n"
    head+=u"       <b pos=\"1\"/>\n"
    head+=u"       <lit v=\" \"/>\n"
    head+=u"     </equal>\n"
    head+=u"     </not>\n"
    head+=u"      </test>\n"
    head+=u"      <out>\n"
    head+=u"        <b pos=\"1\"/>\n"
    head+=u"      </out>\n"
    head+=u"    </when>\n"
    head+=u"  </choose>\n"
    head+=u"</def-macro>\n"
    head+=u""
    head+=u"<def-macro n=\"f_genre_num\" npar=\"1\">\n"
    head+=u"<!--To set the global value storing the TL genre of the last seen word. -->\n"
    head+=u"  <choose>\n"
    head+=u"    <when>\n"
    head+=u"      <test>\n"
    head+=u"        <equal>\n"
    head+=u"          <clip pos=\"1\" side=\"tl\" part=\"learned_gen\"/>\n"
    head+=u"          <lit-tag v=\"m\"/>\n"
    head+=u"        </equal>\n"
    head+=u"      </test>\n"
    head+=u"      <let><var n=\"genre\"/><lit-tag v=\"m\"/></let>\n"
    head+=u"    </when>\n"
    head+=u"    <when>\n"
    head+=u"      <test>\n"
    head+=u"        <equal>\n"
    head+=u"          <clip pos=\"1\" side=\"tl\" part=\"learned_gen\"/>\n"
    head+=u"          <lit-tag v=\"f\"/>\n";
    head+=u"        </equal>\n";
    head+=u"      </test>\n";
    head+=u"      <let><var n=\"genre\"/><lit-tag v=\"f\"/></let>\n"
    head+=u"    </when>\n"
    head+=u"  </choose>\n"
    head+=u"  <choose>\n"
    head+=u"    <when>\n"
    head+=u"      <test>\n"
    head+=u"        <equal>\n"
    head+=u"          <clip pos=\"1\" side=\"tl\" part=\"learned_num\"/>\n"
    head+=u"          <lit-tag v=\"sg\"/>\n"
    head+=u"        </equal>\n"
    head+=u"      </test>\n"
    head+=u"      <let><var n=\"number\"/><lit-tag v=\"sg\"/></let>\n"
    head+=u"    </when>\n"
    head+=u"    <when>\n"
    head+=u"      <test>\n"
    head+=u"        <equal>\n"
    head+=u"          <clip pos=\"1\" side=\"tl\" part=\"learned_num\"/>\n"
    head+=u"          <lit-tag v=\"pl\"/>\n"
    head+=u"        </equal>\n"
    head+=u"      </test>\n"
    head+=u"      <let><var n=\"number\"/><lit-tag v=\"pl\"/></let>\n"
    head+=u"    </when>\n"
    head+=u"  </choose>\n"
    head+=u"</def-macro>\n"
    head+=u"<def-macro n=\"f_set_genre_num\" npar=\"1\">\n"
    head+=u"<!--To set the genre of those words with GD, and the number of those words with ND. -->\n"
    head+=u"<!--This is only used in no alignment template at all is applied. -->\n"
    head+=u"  <choose>\n"
    head+=u"    <when>\n"
    head+=u"      <test>\n"
    head+=u"        <equal>\n"
    head+=u"          <clip pos=\"1\" side=\"tl\" part=\"learned_gen\"/>\n"
    head+=u"          <lit-tag v=\"GD\"/>\n"
    head+=u"        </equal>\n"
    head+=u"      </test>\n"
    head+=u"      <choose>\n"
    head+=u"        <when>\n"
    head+=u"          <test>\n"
    head+=u"            <equal>\n"
    head+=u"              <var n=\"genre\"/>\n"
    head+=u"              <lit-tag v=\"f\"/>\n"
    head+=u"            </equal>\n"
    head+=u"          </test>\n"
    head+=u"          <let><clip pos=\"1\" side=\"tl\" part=\"learned_gen\"/><lit-tag v=\"f\"/></let>\n"
    head+=u"        </when>\n"
    head+=u"        <otherwise>\n"
    head+=u"          <let><clip pos=\"1\" side=\"tl\" part=\"learned_gen\"/><lit-tag v=\"m\"/></let>\n"
    head+=u"        </otherwise>\n"
    head+=u"      </choose>\n"
    head+=u"    </when>\n"
    head+=u"  </choose>\n"
    head+=u"  <choose>\n"
    head+=u"    <when>\n"
    head+=u"      <test>\n"
    head+=u"        <equal>\n"
    head+=u"          <clip pos=\"1\" side=\"tl\" part=\"learned_num\"/>\n"
    head+=u"          <lit-tag v=\"ND\"/>\n"
    head+=u"        </equal>\n"
    head+=u"      </test>\n"
    head+=u"      <choose>\n"
    head+=u"        <when>\n"
    head+=u"          <test>\n"
    head+=u"            <equal>\n"
    head+=u"              <var n=\"number\"/>\n"
    head+=u"              <lit-tag v=\"pl\"/>\n"
    head+=u"            </equal>\n"
    head+=u"          </test>\n"
    head+=u"          <let><clip pos=\"1\" side=\"tl\" part=\"learned_num\"/><lit-tag v=\"pl\"/></let>\n"
    head+=u"        </when>\n"
    head+=u"        <otherwise>\n"
    head+=u"          <let><clip pos=\"1\" side=\"tl\" part=\"learned_num\"/><lit-tag v=\"sg\"/></let>\n"
    head+=u"        </otherwise>\n"
    head+=u"      </choose>\n"
    head+=u"    </when>\n"
    head+=u"  </choose>\n"
    head+=u"</def-macro>\n"
    head+=u"</section-def-macros>\n"
    head+=u"<section-rules>\n"
    return head

def gen_xml_foot():
    foot=u""
    foot+=u"<rule>\n"
    foot+=u"  <pattern>\n"
    foot+=u"    <pattern-item n=\"CAT__ND_GD\"/>\n"
    foot+=u"  </pattern>\n"
    foot+=u"  <action>\n"
    
    
    foot+=u"  <call-macro n=\"f_set_genre_num\">\n"
    foot+=u"    <with-param pos=\"1\"/>\n"
    foot+=u"  </call-macro>\n"
    foot+=u"  <out>\n"
    foot+=u"    <lu>\n"
    foot+=u"      <clip pos=\"1\" side=\"tl\" part=\"whole\"/>\n"
    foot+=u"    </lu>\n"
    foot+=u"  </out>\n"
    foot+=u"  </action><!--isolated word-->\n"
    foot+=u"</rule>\n"
    
    foot+=u"<rule>\n"
    foot+=u"<pattern><pattern-item n=\"CAT__HASGENDER_NUMBER\"/></pattern><action> <call-macro n=\"f_genre_num\"><with-param pos=\"1\"/></call-macro> <call-macro n=\"f_set_genre_num\"><with-param pos=\"1\"/></call-macro> <out><lu> <clip pos=\"1\" side=\"tl\" part=\"whole\"/></lu></out> </action><!--isolated word-->\n"
    foot+=u"</rule>\n"
    
    foot+=u"<rule>\n"
    foot+=u"<pattern><pattern-item n=\"sent\"/></pattern><action> <let><var n=\"number\"/> <lit-tag v=\"sg\"/></let><let><var n=\"genre\"/><lit-tag v=\"m\"/></let> <out><lu> <clip pos=\"1\" side=\"tl\" part=\"whole\"/></lu></out></action><!--isolated word-->\n"
    foot+=u"</rule>\n"
    
    foot+=u"<rule>\n"
    foot+=u"<pattern><pattern-item n=\"any\"/></pattern><action>  <out><chunk name=\"any\" case=\"caseFirstWord\"><tags>             <tag><lit-tag v=\"LRN\"/></tag>       </tags> <lu> <clip pos=\"1\" side=\"tl\" part=\"whole\"/></lu></chunk></out> </action><!--isolated word-->\n"
    foot+=u"</rule>\n"
    
    foot+=u"</section-rules>\n"
    foot+=u"</transfer>\n"
    
    return foot

def gen_rule_list(rules):
    out=[]
    out.append(u"<rule>")
    out.append(u"  <pattern>")
    slcatseq=[ l.get_pos() for l in rules[0].parsed_sl_lexforms ]
    for lexcat in slcatseq:
        out.append(u"    <pattern-item n=\"CAT__"+lexcat+u"\"/>")
    out.append(u"  </pattern>")
    
    out.append(u"  <action>")
    out.append(u"    <choose>")
    for at in rules:
        out.append(u"      <when>")
        out.append(u"        <test>")
        out.append(u"        <and>")
        for i,lf in enumerate(at.parsed_sl_lexforms):
            if lf.has_lemma():
              #  out.append(u"          <or>")
                out.append(u"            <equal>")
                out.append(u"              <clip pos=\""+unicode(i+1)+u"\" side=\"sl\" part=\"lem\" />")
                out.append(u"              <lit v=\""+lf.get_lemma().replace(u"_",u" ")+u"\"/>")
                out.append(u"            </equal>")
                out.append(u"            <equal>")
                out.append(u"              <clip pos=\""+unicode(i+1)+u"\" side=\"sl\" part=\"lem\" />")
                out.append(u"              <lit v=\""+lf.get_lemma().replace(u"_",u" ").title()+u"\"/>")
                out.append(u"            </equal>")
               # out.append(u"          </or>")
            out.append(u"          <equal>")
            out.append(u"            <clip pos=\""+unicode(i+1)+u"\" side=\"sl\" part=\"tags\" />")
            out.append(u"            <lit-tag v=\""+u".".join([lf.get_pos()]+lf.get_tags())+u"\"/>")
            out.append(u"          </equal>")
        out.append(u"        </and>")
        out.append(u"        </test>")
        out.append(u"        <out>")
        for i,lf in enumerate(at.parsed_tl_lexforms):
            out.append(u"          <lu>")
            if lf.has_lemma():
                out.append(u"         <lit v=\""+lf.get_lemma().replace(u"_",u" ")+u"\"/>")
            else:
                #follow alignment
                als=at.get_sl_words_aligned_with(i)
                if len(als) == 0:
                    out.append(u"         <lit v=\"ERROR\"/>")
                else:
                    out.append(u"         <clip pos=\""+unicode(als[0]+1)+u"\" side=\"tl\" part=\"lemh\"/>")
            out.append(u"         <lit-tag v=\""+u".".join([lf.get_pos()]+lf.get_tags())+u"\"/>")
            if not lf.has_lemma() and len(als) > 0:
                out.append(u"         <clip pos=\""+unicode(als[0]+1)+u"\" side=\"tl\" part=\"lemq\"/>")
            out.append(u"          </lu>")
            if i < len(at.parsed_sl_lexforms)-1:
                out.append(u"          <b pos=\""+unicode(i+1)+u"\"/>")
            elif i<len(at.parsed_tl_lexforms)-1:
                out.append(u"          <b/>")
                
        out.append(u"        </out>")
        out.append(u"      </when>")
    out.append(u"      <otherwise>")
    out.append(u"      <reject-current-rule shifting=\"no\" />")
    out.append(u"      </otherwise>")
    out.append(u"    </choose>")
    out.append(u"  </action>")
    out.append(u"</rule>")
    return u"\n".join(out)
    

if __name__=="__main__":
    
    parser = argparse.ArgumentParser(description='Selects bilingual phrases.')
    parser.add_argument('--retratos_rules')
    #value = dir in which bilphrases will be written
    #ATs = std output
    args = parser.parse_args(sys.argv[1:])
    
    f=codecs.open(args.retratos_rules, 'r', ENCODING)
    rules=ruleLearningLib.RetratosRule.parse_rules(f)
    
    cats=set()
    sllexmap=dict()
    for r in rules:
        for l in r.parsed_sl_lexforms:
            cats.add(l.get_pos())
        slposmatetr=r.get_pos_list_str()
        if not slposmatetr in sllexmap:
            sllexmap[slposmatetr]=[]
        sllexmap[slposmatetr].append(r)
    
    header = gen_xml_head(cats)
    print header.encode(ENCODING)
    
    for slseq in sllexmap:
        locrules=sllexmap[slseq]
        sortedlocrules=sorted(locrules,key=operator.attrgetter('rightSideFreq','restrictionFreq'),reverse=True)
        
        rulestr=gen_rule_list(sortedlocrules)
        print rulestr.encode(ENCODING)
        #for r in sortedlocrules:
        #    print str(r.rightSideFreq)+" "+str(r.restrictionFreq)
        #    print r
    
    footer = gen_xml_foot()
    print footer.encode(ENCODING)
    
