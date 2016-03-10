#!/bin/bash
time=$(date +%s)
for i in {1..10}; do {
	sign=`curl -s "http://stan.test.gurtam.net:8030" | grep -i -o '"sign" value="[^"]*"' | cut -c15-58`
	#-H "Content-Type:application/x-www-form-urlencoded" 
	fn=`date +%d%m%y`
	#echo $sign

	resp=`curl -s -H "Content-Type:application/x-www-form-urlencoded" -iX POST "http://stan.test.gurtam.net:8030/oauth.html" --data "login=stan93_$i&passw=stan&lang=ru&client_id=Wialon+Hosting&access_type=-1&activation_time=0&duration=2592000&flags=2&redirect_uri=http://stan.test.gurtam.net:8030/checker.html&response_type=hash&wialon_sdk_url=&sign=$sign" | grep -i -o 'HTTP/1.0[^"]*'| cut -c10-12`
	#resp=`curl -is --data-urlencode "login=biguser&passw=&lang=ru&client_id=Wialon+Hosting&access_type=-1&activation_time=0&duration=2592000&flags=2&redirect_uri=http://stan.test.gurtam.net:8030/checker.html&response_type=hash&wialon_sdk_url=&sign=$sign" "http://stan.test.gurtam.net:8030/oauth.html"`
	#| grep -i -o 'HTTP/1.0[^"]*'| cut -c10-12`" 
	echo $resp
	if [ "$resp" = "301" ];
		then echo "" >> "$fn.txt"
	fi
} done;
echo "Выполнено за "$(($(date +%s)-$time))" с."