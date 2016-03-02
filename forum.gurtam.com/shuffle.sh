#!/bin/bash
time=$(date +%s)
#change i up to 100k
for i in {1..100};
do
	{
	url="http://forum.gurtam.com/viewtopic.php?pid="$i
	echo $url
	
	#url=`curl -s -w %{time_total}\\n "$url" | grep -i -o 'http://forum.gurtam.com/view[^"a]*' | shuf -n 1`
#debug echo
	
	# write urls in file
	#arr=$(echo $url | tr ";" "\n")	
			#for x in $arr
			#do
			#	echo "$x" 1>>forum_urls.txt
			#done		
#check for 200
	if 
		[ `curl -Is "$url" | head -n 1 | grep -i -o '200'` = "" ]
	then
		echo "Not 200 Status "$url 1>>response_not_200.txt
	fi
	}
done
#cat forum_urls.txt | sort | uniq > uniq_forum_urls.txt
echo "Done in "$(($(date +%s)-$time))" seconds."
