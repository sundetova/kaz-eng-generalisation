BEGIN{
print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
print "<!DOCTYPE mteval SYSTEM \"mteval-xml-v1.5a.dtd\">";
print "<mteval>";
print "<" settype " setid=\"apertium\" srclang=\"" srclang "\" trglang=\"" trglang "\" sysid=\"" sysid "\" refid=\"" refid "\">";
print "<doc docid=\"" docid "\" genre=\"nw\">";
}
{ printf("<seg id=\"%d\">%s</seg>\n",NR, $0); }
END{
print "</doc>";
print "</" settype ">";
print "</mteval>";
}
 
