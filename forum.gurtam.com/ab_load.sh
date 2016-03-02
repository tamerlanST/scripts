#!/bin/bash
#http://plutov.by/post/apache_bench_easy_tool
#i=0
#for i in {1..5000};
#do {
ab -n 10000 -c 16 http://forum.gurtam.com/img/avatars/17583.jpg
#let i=i+1
#} done
#time=$(date +%s)
#i=0
#while read line; do 
#curl -H "Accept-Encoding:gzip" -s $line > /dev/null
#let i=i+1
#echo "$line"; 
#done < reportpng.txt
#while read line; do 
#curl -H "Accept-Encoding:gzip" -s $line > /dev/null
#let i=i+1
#echo "$line"; 
#done < reportjpg.txt
#t=$(($(date +%s)-$time))
#echo "JPG+PNG Выполнено за "$t" с. "$i" шт."
#echo "Среднее время на картинку, с."
#echo "$t/$i" | bc -l