#!/bin/bash

time=$(date +%s)
for i in {5000..5000}; do {
#sid=`curl -s "http://qa.test:13019/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://qa.test:13019/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}" > /dev/null

#sid=`curl -s "http://qa.test:15019/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://qa.test:15019/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}" > /dev/null

#sid=`curl -s "http://qa.test:15019/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://qa.test:15019/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}" > /dev/null

#sid=`curl -s "http://qa.test:17019/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://qa.test:17019/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}" > /dev/null

#sid=`curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}?wialon_sdk_url=http://qa.test"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}?wialon_sdk_url=http://qa.test" > /dev/null
#sid=`curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}?wialon_sdk_url=http://qa.test"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}?wialon_sdk_url=http://qa.test" > /dev/null

#sid=`curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}" > /dev/null
#sid=`curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}" > /dev/null

#sid1=`curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
#curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stanbu_$i\",\"password\":\"stan_$i\"\}" 
#> /dev/null
#sid2=`curl -s "http://qa.test/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan_$i\",\"password\":\"stan_$i\"\}"| grep -i -o '"eid":"[^"]*"'`
curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"
# > /dev/null


echo "core/login from user stan93_"$i
#	пишет в файл сиды сессий
#arr=$(echo $sid1 | tr ";" "\n")	
#	for x in $arr
#		do
#			echo "$i$x" 1>>chol.txt	
#		done


#arr=$(echo $sid2 | tr ";" "\n")	
#	for x in $arr
#		do
#			echo "$i$x" 1>>chol.txt	
#		done

}


done;
echo "Выполнено за "$(($(date +%s)-$time))" с."

#https://trc-api.wialon.com/wialon/ajax.html?svc=core/login&params={"user":"Morod","password":"morod"}
#https://trc-api.wialon.com/wialon/ajax.html?svc=core/create_auth_hash&params={}&sid=026e8b88f5dd68742a83496ec80f4a87
