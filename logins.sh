#!/bin/bash
n1=$1
n2=$2
n3=$3 #multi treading

time=$(date +%s)
for (( i=$n1; i<$n2; i++ ))
do {
#url=http://qa.test:8019
url=http://stan.test.gurtam.net:8030
#url=http://tata.test.gurtam.net:8019
#login
	sid=`curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"| jq '.["eid"]' | cut -c2-33`
	#curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"
	echo $i sid=$sid
	authHash=`curl -s "$url/wialon/ajax.html?svc=core/create_auth_hash&params=\{\}&sid=$sid" | cut -c14-45`
	echo $i authHash=$authHash
	resp=`curl -s "$url/wialon/ajax.html?svc=core/use_auth_hash&params=\{\"authHash\":\"$authHash\",\"operateAs\":\"stan93_$i\"\}"| jq '.["eid"]' | cut -c2-33`
	echo $i use_auth_hash sid=$resp

	#resp=`curl -s "$url/wialon/ajax.html?svc=core/logout&params=\{\}&sid=$sid"`
	#echo $resp

#logout


	#| jq '.["eid"]' | cut -c2-33`
	#curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"
	#echo $i $response
	resp=`curl -s "$url/wialon/ajax.html?svc=core/logout&params=\{\}&sid=$sid"`
	echo $i logout:$resp

#sleep 30

	evts=`curl -s "$url/avl_evts?sid=$sid"`
	echo $i $evts
	} done;
echo "$n3 Выполнено за "$(($(date +%s)-$time))" с."