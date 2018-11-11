#!/bin/bash
suburl='wiki/latest/'
cat locales
read -p "What locales or languages do you want to use? " locales
for url in $(cat url);do
	for locale in $locales; do
		parses=($(curl $url$locale$suburl | awk '{print $9}'))
		echo ${parses[0]}
		wget  $url$locale$suburl${parses[0]}
	done
done
