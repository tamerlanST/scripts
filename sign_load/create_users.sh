#!/bin/bash
time=$(date +%s)
sid=`curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login&params=\{\"user\":\"biguser\",\"password\":\"\"\}" | jq '.["eid"]' | cut -c2-33`
echo $sid
for i in {3295..200000}; do {
	curl -s "http://cms.stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/create_user&params=\{\"creatorId\":68970,\"name\":\"stan93_$i\",\"password\":\"stan\",\"dataFlags\":1\}&sid=$sid"
	#echo "Create user stan93_"$i
}
done;
echo "Выполнено за "$(($(date +%s)-$time))" с."