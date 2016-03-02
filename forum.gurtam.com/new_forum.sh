#!/bin/bash
time=$(date +%s)
for i in {2011..5000}; 
do {
	url="http://forum.gurtam.com/viewtopic.php?id="$i"&p=0"
#ищет на странице ссылки по маске
	img_url=`curl -s $url | grep -i -o 'http://forum.gurtam.com[^"]*.jpg'`
		echo $url
		if [ "$img_url" != "" ]
		then 	
			arr=$(echo $img_url | tr ";" "\n")	
			for x in $arr
			do
				echo "$x" 1>>reportjpg_big.txt
			done		
		fi	
} done;
cat reportjpg.txt | sort | uniq > reportjpg.txt
echo "Выполнено за "$(($(date +%s)-$time))" с."










