#!/bin/bash
time=$(date +%s)
i=0
for j in {1..3};
do
	{
	while read line; do 
		#echo $line
		if 
			[ "`curl -Is "Accept-Encoding:gzip" $line | head -n 1 | grep -i -o "200"`" != "200" ]
		then
			echo "Not 200 Status "$line 1>>forum_img_response_not_200.txt
		fi
		#let i=i+1
	done < img.txt
	}
done
t=$(($(date +%s)-$time))
echo "IMG Done in "$t" sec."
#$i" шт."
#echo "Среднее время на картинку, с."
#echo "$t/$i" | bc -l
