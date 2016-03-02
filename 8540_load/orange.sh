#!/bin/bash

time=$(date +%s)
for i in {1..5}; do 
{
	sid=`curl -s "http://trc-api.wialon.com/wialon/ajax.html?svc=core/login&params=\{\"user\":\"Morod\",\"password\":\"morod\"\}"| grep -i -o '"eid":"[^"]*"' | cut -c8-39`
	echo $sid
	authHash=`curl -s "http://trc-api.wialon.com/wialon/ajax.html?svc=core/create_auth_hash&params=\{\}&sid=$sid"`
	echo $authHash
#	пишет в файл сиды сессий
	arr=$(echo $sid | tr ";" "\n")	
		for x in $arr
			do
				echo "$i$x" 1>>orange.txt	
			done
	arr=$(echo $authHash | tr ";" "\n")	
		for x in $arr
			do
				echo "$i$x" 1>>orange.txt	
			done
}
done;
for i in {1..5}; do 
{
	sid=`curl -s "http://trc-api.wialon.com/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_002\",\"password\":\"stan\"\}"| grep -i -o '"eid":"[^"]*"' | cut -c8-39`
	echo $sid
	authHash=`curl -s "http://trc-api.wialon.com/wialon/ajax.html?svc=core/create_auth_hash&params=\{\}&sid=$sid"`
	echo $authHash
#	пишет в файл сиды сессий
	arr=$(echo $sid | tr ";" "\n")	
		for x in $arr
			do
				echo "$i$x" 1>>orange.txt	
			done
	arr=$(echo $authHash | tr ";" "\n")	
		for x in $arr
			do
				echo "$i$x" 1>>orange.txt	
			done
}
done;
echo "Выполнено за "$(($(date +%s)-$time))" с."
