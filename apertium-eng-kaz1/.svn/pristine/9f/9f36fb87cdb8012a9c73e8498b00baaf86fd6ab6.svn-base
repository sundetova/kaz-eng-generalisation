#!/usr/bin/env python3

### Example Usage ###
# dev/lexcdiff.py apertium-eng-kaz.kaz.lexc ../apertium-kaz/apertium-kaz.kaz.lexc --comment "Use/MT kaz-eng" --lex Nouns

import sys, re
import argparse

parser = argparse.ArgumentParser(description='Find stems missing in a base lexc.  Useful for merging two lexc files.')

parser.add_argument('lexc1', type=argparse.FileType('r'),
	default=sys.stdin, help='the base file')
parser.add_argument('lexc2', type=argparse.FileType('r'),
	help='the file to look find extra stems in')
parser.add_argument('--lex', dest='lexicon', action='store', 
	help='which lexicon to extract')
parser.add_argument('--noformat', dest='notFormatted', action='store_true',
	help='just return a list of stems on one line')
parser.add_argument('--comment', dest='comment', action='store',
	help='an optional comment to add at the end of lines output by this script')

args = parser.parse_args()


theLexicon = re.compile("\s*LEXICON\s*%s\s*" % args.lexicon)
anyLexicon = re.compile("\s*LEXICON.*")

def getLexicon(lexc):
	global theLexicon, anyLexicon
	capture = False
	output = ""

	for line in lexc:
		if capture and anyLexicon.match(line):
			capture = False
			break
		if capture:
			output += line
		if theLexicon.match(line):
			capture = True
	
	return output

#cleanStem = re.compile("^(.*):.*")
cleanStem = re.compile("^[^!]*(?=\:.* ;)")
# FIXME: there's a bug here; it's not skipping quotes right:
cleanGych = re.compile("^\s*(.*):(.*?)\s*([\w\-]*)\s*;.*!\s*?\"?(.*)\"?(.*)")

def getStem(line):
	stem = ""
	#print(line)
	matcher = cleanStem.search(line)
	if matcher:
		stem = matcher.group(0).strip()
		return stem
	else:
		return False

def getStems(lexc):
	stems = set()
	entries = {}
	for line in lexc.split('\n'):
		stem = getStem(line)
		if stem:
			stems.add(stem)
			#entries[stem] = line.strip()
			#entries[stem] = cleanGych.sub(line, '\1:\2 \3 ; ! \"\4\" \5')
			entries[stem] = cleanGych.sub('\g<1>:\g<2> \g<3> ; ! \"\g<4>\" \g<5>', line)
			#FIXME: to fix above quote bug:
			entries[stem] = re.sub('\"\s*\"', "\"", entries[stem])
			#entries[stem] = cleanGych.sub('+\g<2>+\g<3>+', line)
			#entries[stem] = cleanGych.sub(line, '\g<1> ; \"$2\" ! \5')
			if args.comment:
				entries[stem] += " ! " + args.comment
	return (stems, entries)


lexc1 = getLexicon(args.lexc1)
lexc2 = getLexicon(args.lexc2)

(stems1, entries1) = getStems(lexc1)
(stems2, entries2) = getStems(lexc2)

diff = stems1 - stems2
#entries = entries1 + entries2

if args.notFormatted:
	print(diff)
else:
	for stem in diff:
		print(entries1[stem])

#print(lexc1)
