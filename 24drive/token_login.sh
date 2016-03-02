#!/bin/bash

time=$(date +%s)
tkn="1da95ac188200ef5e27ef193bb008a161079E3E96814CCB6510D2F3A3C79798BFCC9E753";
url="http://qa.test/"
echo $tkn 
#for i in {5000..9999}; do {

curl "$urlwialon/ajax.html?svc=token/login&params=\{\"token\":\"$tkn\"\}"
#sid2=`curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`

#http://qa.test/avl_evts


#sid2=`curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}" > /dev/null


#echo "core/login from user stan_"$i

#	пишет в файл сиды сессий
#arr=$(echo $sid1 | tr ";" "\n")	
#	for x in $arr
#		do
#			echo "$i$x" 1>>chol.txt	
#		done

#}


#done;