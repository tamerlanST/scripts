#!/bin/bash
time=$(date +%s)
server='http://stan.test.gurtam.net:8030/wialon/ajax.html?svc'
sid=`curl -s "$server=core/login&params=\{\"user\":\"biguser\",\"password\":\"\"\}" | jq '.["eid"]' | cut -c2-33`
echo $sid
n1=$1
n2=$2

for (( i=$n1; i<$n2; i++ ))
do {
	#curl -s "http://cms.stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/create_user&params=\{\"creatorId\":68970,\"name\":\"stan93_$i\",\"password\":\"stan\",\"dataFlags\":1\}&sid=$sid"
	#echo "Create user stan93_"$i
	echo $i
#core/search_items
	id=`curl -s "$server=core/search_items&params=\{\"spec\":\{\"itemsType\":\"user\",\"propName\":\"sys_name\",\"propValueMask\":\"stanbu_$i\",\"sortType\":\"sys_name\"\},\"force\":1,\"flags\":261,\"from\":0,\"to\":19\}&sid=$sid" | grep -i -o '"id":[^"]*,' | cut -c6-10`
	echo $id

#core/delete_user
	#echo \{\"itemId\":$id\}
	dresp=`curl -s "$server=item/delete_item&params=\{\"itemId\":$id\}&sid=$sid"`
	echo $dresp
}
done;
echo "Выполнено за "$(($(date +%s)-$time))" с."