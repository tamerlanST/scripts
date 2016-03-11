#!/bin/bash
time=$(date +%s)
for i in {1..10}; do {
#url=https://hst-api.wialon.com
url=http://stan.test.gurtam.net:8030
#true
	sid=`curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"| jq '.["eid"]' | cut -c2-33`
	#curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"
	echo $sid
	resp=`curl -s "$url/wialon/ajax.html?svc=core/logout&params=\{\}&sid=$sid"`
	echo $resp

#false

	sid1=`curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan92_$i\",\"password\":\"stan\"\}"| jq '.["eid"]' | cut -c2-33`
	#curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"
	echo $sid1
	resp=`curl -s "$url/wialon/ajax.html?svc=core/logout&params=\{\}&sid=$sid"`
	echo $resp

	} done;
echo "Выполнено за "$(($(date +%s)-$time))" с."