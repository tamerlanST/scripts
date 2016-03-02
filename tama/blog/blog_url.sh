#!/bin/bash
time=$(date +%s)
for y in {2010..2015}; 
do {
	for m in {1..12};
	do { 
	
	url="http://blog.gurtam.com/"$y"/"$m"/"
	#echo $url
	if 
		[ `curl -Is "$url" | head -n 1 | grep -i -o '200'` = "" ]
	then
		echo "Not 200 Status "$url 1>>blog_response_not_200.txt
	fi
	

	} done;		
} done;
echo "Выполнено за "$(($(date +%s)-$time))" с."
