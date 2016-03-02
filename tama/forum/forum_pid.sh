#!/bin/bash
time=$(date +%s)
#change i up to 100000
for i in {1..200};
do
	{
	url="http://forum.gurtam.com/viewtopic.php?pid="$i
	#echo $url
	#check for 200
	if 
		[ `curl -Is "$url" | head -n 1 | grep -i -o '200'` = "" ]
	then
		echo "Not 200 Status "$url 1>>forum_response_not_200.txt
	fi
	}
done
echo "PID Done in "$(($(date +%s)-$time))" sec."
