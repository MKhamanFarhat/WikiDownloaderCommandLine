#!/bin/bash
suburl='wiki/latest/'
logfile='log.txt'
cat locale
read -p "What locales or languages do you want to use? " locales
for url in $(cat url);do
	for locale in $locales; do
		parses=($(curl $url$locale$suburl | awk '{print $9}'))
		echo ${parses[0]}
		wget  -a $logfile $url$locale$suburl${parses[0]}
	done
done
