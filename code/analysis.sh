#!/bin/bash
#
# Find the urls tested in dumped RAM
while read url ; do
	hexdump -C 1.dump | grep $url > $((1))$url.txt
done <url-list
