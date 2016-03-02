#!/bin/bash
#https://redmine.gurtam.net/issues/9209
time=$(date +%s)
i=0
while read line; do 
	curl -H "Accept-Encoding:gzip" -s $line > /dev/null
	let i=i+1
	#echo "$line"; 
	done < reportpng.txt
while read line; do 
	curl -H "Accept-Encoding:gzip" -s $line > /dev/null
	let i=i+1
	#echo "$line"; 
	done < reportjpg.txt
t=$(($(date +%s)-$time))
echo "JPG+PNG Выполнено за "$t" с. "$i" шт."
echo "Среднее время на картинку, с."
echo "$t/$i" | bc -l


