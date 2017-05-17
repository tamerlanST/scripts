#!/bin/bash
time=$(date +%s)
server='http://qa4.test:8019/wialon/ajax.html'
params='{"user":"stan","password":"stan"}'
sid=`curl -s "$server?svc=core/login" --data-urlencode "params=$params"  | jq '.eid' | cut -c2-33`
echo $sid
#exit 0

n1=$1
n2=$2

for (( i=$n1; i<$n2; i++ ))
do {
	params='{"creatorId":70642,"name":"test","hwTypeId":"90","dataFlags":1}'
	resp=`curl -s "$server?svc=core/create_unit&sid=$sid" --data-urlencode "params=$params" | jq '.item.id'`
	#echo "Create unit stan93_"$i
	echo $i $resp



#core/search_items
#	id=`curl -s "$server=core/search_items&params=\{\"spec\":\{\"itemsType\":\"user\",\"propName\":\"sys_name\",\"propValueMask\":\"stanbu_$i\",\"sortType\":\"sys_name\"\},\"force\":1,\"flags\":261,\"from\":0,\"to\":19\}&sid=$sid" | grep -i -o '"id":[^"]*,' | cut -c6-10`
#	echo $id

#core/delete_user
#	dresp=`curl -s "$server=item/delete_item&params=\{\"itemId\":$id\}&sid=$sid"`
#	echo $dresp
}
done;
echo "Выполнено за "$(($(date +%s)-$time))" с."