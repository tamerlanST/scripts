#!/bin/bash
time=$(date +%s)
fn=`date +%d%m%y`
#url=https://hst-api.wialon.com
url=http://stan.test.gurtam.net:8030
sid=`curl -s "$url/wialon/ajax.html?svc=core/login&params=\{\"user\":\"biguser\",\"password\":\"\"\}"| jq '.["eid"]' | cut -c2-33`
echo $sid
for i in {1..1}; do {
	authHash=`curl -s "$url/wialon/ajax.html?svc=core/create_auth_hash&params=\{\}&sid=$sid" | cut -c14-45`
	echo $authHash
	resp=`curl -s "$url/wialon/ajax.html?svc=core/use_auth_hash&params=\{\"authHash\":\"$authHash\",\"operateAs\":\"stan93_1\"\}"`
	echo $resp
	if [ "$resp" = "301" ];
		then echo "$i" >> "$fn.txt"
	fi
} done;
echo "Выполнено за "$(($(date +%s)-$time))" с."
