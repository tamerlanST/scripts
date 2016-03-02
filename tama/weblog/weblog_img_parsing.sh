#!/bin/bash
time=$(date +%s)
for y in {2010..2015}; 
do {
	for m in {1..12};
	do { 
	


	url="http://weblog.gurtam.com/"$y"/"$m"/"
	echo $url
#search for *.jpg
	img_url=`curl -s $url | grep -i -o 'http://weblog.gurtam.com/wp-content/uploads/[^"]*.jpg'`
	echo $img_url	
		if [ "$img_url" != "" ]
		then 	
			arr=$(echo $img_url | tr ";" "\n")	
			for x in $arr
			do
				echo "$x" 1>>weblog_img1.txt
			done		
		fi
#search for *.png
	img_url=`curl -s $url | grep -i -o 'http://weblog.gurtam.com/wp-content/uploads/[^"]*.png'`
	echo $img_url	
		if [ "$img_url" != "" ]
		then 	
			arr=$(echo $img_url | tr ";" "\n")	
			for x in $arr
			do
				echo "$x" 1>>weblog_img1.txt
			done		
		fi	

	} done;		
} done;
cat weblog_img1.txt | sort | uniq > weblog_img.txt
echo "Выполнено за "$(($(date +%s)-$time))" с."