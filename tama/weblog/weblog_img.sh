#!/bin/bash
time=$(date +%s)
i=0
for j in {1..20};
do
	{
	while read line; do 
		line=$(perl -MURI::Escape -e 'print uri_escape shift, , q{^A-Za-z0-9\-._~/:}' -- "$line")
		#echo $line
		if 
			[ "`curl -Is "Accept-Encoding:gzip" $line | head -n 1 | grep -i -o "200"`" != "200" ]
		then
			echo "Not 200 Status "$line 1>>weblog_img_response_not_200.txt
		fi
		#let i=i+1
	done < weblog_img.txt
	}
done
t=$(($(date +%s)-$time))
echo "IMG Done in "$t" sec."
#$i" шт."
#echo "Среднее время на картинку, с."
#echo "$t/$i" | bc -l
