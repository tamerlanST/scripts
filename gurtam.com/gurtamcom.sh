#!/bin/bash
time=$(date +%s)
i=0
for j in {1..1};
do
	{
	while read line; do 
		#line=$(perl -MURI::Escape -e 'print uri_escape shift, , q{^A-Za-z0-9\-._~/:}' -- "$line")
		echo $line
		if 
			[ "`curl -Is $line | head -n 1 | grep -i -o "200"`" != "200" ]
		then
			echo "Not 200 Status "$line 1>>gurtamcom_response_not_200.txt
			#echo $line
		fi
		#let i=i+1
	done < urls.txt
	}
done
t=$(($(date +%s)-$time))
echo "Gurtamcom Done in "$t" sec."
#$i" шт."
#echo "Среднее время на картинку, с."
#echo "$t/$i" | bc -l


#http://blog.gurtam.com/wp-content/uploads/2011/06/Яхта.jpg
#curl -Is "Accept-Encoding:gzip" http://blog.gurtam.com/wp-content/uploads/2011/06/Яхта.jpg | head -n 1