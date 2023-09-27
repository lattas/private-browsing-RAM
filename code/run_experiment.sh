#!/bin/bash
#
# Browse some dummy websites in private mode
bash browsing_comp.sh
echo "browsing done."
# Dump Memory
source exp_count
echo $COUNT
sudo bash dumping.sh
cat d*.dump > $COUNT.dump
rm d*.dump
echo "dump done."
# Analyse dumped memory
while read url ; do
	hexdump -C $COUNT.dump | grep $url > $COUNT$url.txt
done <url-list
echo "analysis done."
echo "COUNT="$(($COUNT+1)) > "exp_count"