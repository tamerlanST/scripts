#!/bin/bash

server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
params='{"user":"stan","password":"stan"}'
sid=`curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login" --data-urlencode "params=$params" | jq .eid | cut -c2-33`
echo $sid


	for i in {1..1000}; do

# delete_driver
params='{"itemId":599513,"id":'$i',"callMode":"delete"}'
resp=`curl -s "$server?svc=resource/update_driver&sid=$sid" --data-urlencode "params=$params"`
	#echo $resp
	mresp='['$i',null]'
	#echo $mresp
	if [ "$mresp" != "$resp" ];
		then echo $i is not exist
	fi	

# delete_driver
params='{"itemId":633468,"id":'$i',"callMode":"delete"}'
resp=`curl -s "$server?svc=resource/update_driver&sid=$sid" --data-urlencode "params=$params"`
	#echo $resp
	mresp='['$i',null]'
	#echo $mresp
	if [ "$mresp" != "$resp" ];
		then echo $i is not exist
	fi		

done