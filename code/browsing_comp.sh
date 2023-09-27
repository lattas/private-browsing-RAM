#!/bin/bash
# Use mozilla firefox to browse the websites provided
# in private-browsing mode
firefox --private-window
while read url ; do
	firefox --private-window $url
	sleep 5
	pkill -f firefox
done <url-list
