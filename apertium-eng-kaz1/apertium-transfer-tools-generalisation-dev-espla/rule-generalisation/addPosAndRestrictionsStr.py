#!/usr/bin/python
# coding=utf-8
# -*- encoding: utf-8 -*-

import sys,re,argparse, ruleLearningLib
from ruleLearningLib import AT_ParsingError

parser = argparse.ArgumentParser(description='')
parser.add_argument('--tag_groups_file_name',required=True)
parser.add_argument('--tag_sequences_file_name',required=True)
parser.add_argument('--rich_ats',action='store_true')
parser.add_argument('--only_lexical',action='store_true')
parser.add_argument('--for_tt1_beam',action='store_true')
parser.add_argument('--print_box_index_from_dict')
args = parser.parse_args(sys.argv[1:])

include_restrictions= not args.rich_ats and not args.for_tt1_beam

if not args.for_tt1_beam:
	ruleLearningLib.AT_LexicalTagsProcessor.initialize(args.tag_groups_file_name,args.tag_sequences_file_name)

boxesInvDict=dict()
if args.print_box_index_from_dict:
	for l in open(args.print_box_index_from_dict):
		l=l.rstrip('\n').decode('utf-8')
		parts=l.split('\t')
		boxesInvDict[parts[1]]=parts[0]

for line in sys.stdin:
	line=line.rstrip('\n').decode('utf-8')
	
	pieces=line.split(u' | ')
	freqstr=pieces[0]
	atstr=u'|'.join(pieces[1:5])
	
	at = ruleLearningLib.AlignmentTemplate()
	
	try:
		at.parse(atstr)
		if not args.for_tt1_beam:
			at.add_explicit_empty_tags()
		if not args.print_box_index_from_dict:
			if args.only_lexical:
				print at.get_tags_str().encode('utf-8')+" | "+line.encode('utf-8')
			else:
				print at.get_pos_list_str(include_restrictions).encode('utf-8')+" | "+line.encode('utf-8')
		else:
			key= at.get_tags_str() if args.only_lexical else at.get_pos_list_str(include_restrictions)
			print boxesInvDict[key]		
			
	except AT_ParsingError as detail:
		print >> sys.stderr, "Error parsing AT from line: "+line.encode('utf-8')
		print >> sys.stderr, "Detail: "+str(detail)
	
