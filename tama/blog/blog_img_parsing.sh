#!/bin/bash
time=$(date +%s)
for y in {2010..2015}; 
do {
	for m in {1..12};
	do { 
	


	url="http://blog.gurtam.com/"$y"/"$m"/"
	echo $url
#search for *.jpg
	img_url=`curl -s $url | grep -i -o 'http://blog.gurtam.com/wp-content/uploads/[^"]*.jpg'`
	#img_url=`perl -MURI::Escape -e 'print uri_escape shift, , q{^A-Za-z0-9\-._~/:}' -- "$img_url"`
	echo $img_url	
		if [ "$img_url" != "" ]
		then 	
			arr=$(echo $img_url | tr ";" "\n")	
			for x in $arr
			do
				echo "$x" 1>>blog_img1.txt
			done		
		fi
#search for *.png
	img_url=`curl -s $url | grep -i -o 'http://blog.gurtam.com/wp-content/uploads/[^"]*.png'`
	#img_url=`perl -MURI::Escape -e 'print uri_escape shift, , q{^A-Za-z0-9\-._~/:}' -- "$img_url"`
	echo $img_url	
		if [ "$img_url" != "" ]
		then 	
			arr=$(echo $img_url | tr ";" "\n")	
			for x in $arr
			do
				echo "$x" 1>>blog_img1.txt
			done		
		fi	

	} done;		
} done;
cat blog_img1.txt | sort | uniq > blog_img.txt
echo "Выполнено за "$(($(date +%s)-$time))" с."