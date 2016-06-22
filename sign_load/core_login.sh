#!/bin/bash
n1=$1
n2=$2
n3=$3 #multi treading

time=$(date +%s)
for (( i=$n1; i<$n2; i++ ))
do {
#url=http://qa.test:8019
#url=http://stan.test.gurtam.net:8030
url=http://tata.test.gurtam.net:8019
#true
	sid=`curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"| jq '.["eid"]' | cut -c2-33`
	#curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"
	echo $i   $sid
	#resp=`curl -s "$url/wialon/ajax.html?svc=core/logout&params=\{\}&sid=$sid"`
	#echo $resp

#false

#	sid1=`curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan92_$i\",\"password\":\"stan\"\}"| jq '.["eid"]' | cut -c2-33`
	#curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"
#	echo $sid1
#	resp=`curl -s "$url/wialon/ajax.html?svc=core/logout&params=\{\}&sid=$sid"`
#	echo $resp

	} done;
echo "$n3 Выполнено за "$(($(date +%s)-$time))" с."