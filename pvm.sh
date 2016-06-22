
#!/bin/bash
fn=`date +%d%m%y`
server='http://cms.stan.test.gurtam.net:8030/wialon/ajax.html'
pvm=`cat p1.txt`
echo $pvm
sid=`curl -s "$server?svc=core/login&params=\{\"user\":\"stan\",\"password\":\"stan\"\}" | jq '.["eid"]' | cut -c2-33`
#echo $sid
#item/create_unit_group
	#resp=`curl -s "$server?svc=core/create_unit_group&params=\{\"creatorId\":10003,\"name\":\"rapi_core/create_unit_group\",\"dataFlags\":1\}&sid=$sid" | sed 's/"id":[^"]*,//g'`
	#echo $resp												 
	#mresp='{"item":{"nm":"rapi_core\/create_unit_group","cls":5,"mu":0,"u":[],"uacl":-1},"flags":1}'
	#echo $mresp
	#if [ "$mresp" != "$resp" ];
	#	then echo "core/create_unit_group" >> "$fn.txt"
	#fi


	#curl -s "http://cms.stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/search_items&params={\"spec\":{\"itemsType\":\"avl_unit\",\"propName\":\"sys_unit_groups\",\"propValueMask\":\"$pvm\",\"propType\":\"list\",\"sortType\":\"sys_name\"},\"force\":1,\"flags\":1,\"from\":0,\"to\":0}&sid=$sid"