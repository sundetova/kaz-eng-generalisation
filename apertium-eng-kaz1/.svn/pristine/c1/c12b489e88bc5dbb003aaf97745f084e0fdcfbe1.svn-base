# Wrap text files in XML for mteval
# it adds unnecesary attributes to some files
# MLF 20141203
# KazNU course
echo $6, $7 
awk -f wrap.awk -v settype="srcset" -v docid="zzz" -v srclang="$1" -v trglang="$2" -v sysid="$6" -v refid="$7" $3.txt >$3.xml
awk -f wrap.awk -v settype="tstset" -v docid="zzz" -v srclang="$1" -v trglang="$2" -v sysid="$6" -v refid="$7" $4.txt >$4.xml
awk -f wrap.awk -v settype="refset" -v docid="zzz" -v srclang="$1" -v trglang="$2" -v sysid="$6" -v refid="$7" $5.txt >$5.xml
