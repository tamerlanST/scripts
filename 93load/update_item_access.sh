#!/bin/bash
time=$(date +%s)
fn=`date +%d%m%y`
url=http://hst-api.wialon.com/wialon/ajax.html?svc
sid=`curl -s "$url=core/login&params=\{\"user\":\"biguser\",\"password\":\"\"\}"| jq '.["eid"]' | cut -c2-33`
for j in {69518..69524}; do {
	for i in {91635..291695}; do {
		resp=`curl -s "$url=user/update_item_access&params=\{\"userId\":$i,\"itemId\":$j,\"accessMask\":-1\}&sid=$sid"` >> /dev/null
		echo $i"___"$j
		if [ "$resp" != "{}" ];
			then echo "$i" >> "$fn.txt"
		fi
	} done;
} done;
echo "Выполнено за "$(($(date +%s)-$time))" с."