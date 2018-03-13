#!/bin/bash

server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
params='{"user":"stan","password":"stan"}'
sid=`curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login" --data-urlencode "params=$params" | jq .eid | cut -c2-33`

UNIT_LIST=(600233 600236 600237 600239 600243 600246 600247 600249 600253 600254)
RESOURCE_LIST=(599513 633468 )

for unit in  "${UNIT_LIST[@]}"; do
for resource in "${RESOURCE_LIST[@]}"; do
	for i in {1..1}; do

	# create driver
	params='{"c":"","ck":0,"ds":"","id":0,"n":"'$resource'_'$unit'_'$i'","p":"","r":0,"f":0,"pwd":"","jp":{},"itemId":'$resource',"callMode":"create"}'
	resp1=`curl -s "$server?svc=resource/update_driver&sid=$sid" --data-urlencode "params=$params"`
	driver=`echo "$resp1" | jq '.[0]'`
        #echo $resp1
		mresp='['$driver',{"id":'$driver',"n":"'$unit'_'$i'","c":"","jp":{},"ej":{},"pwd":"","ds":"","p":"","r":0,"f":1,"ck":0,"bu":0,"pu":0,"bt":0,"bs":0,"pos":{"y":0,"x":0}}]'
		#echo $mresp
		if [ "$mresp" != "$resp1" ];
			
			then echo  error of create $unit $i driver
			echo $resp1 
		fi
	
	
	#bind_driver
	params='{"resourceId":'$resource',"driverId":'$driver',"time":0,"unitId":'$unit',"mode":true}'
	resp=`curl -s "$server?svc=resource/bind_unit_driver&sid=$sid" --data-urlencode "params=$params"`
		#echo $resp			   
		mresp='{}'
		#echo $mresp
		if [ "$mresp" != "$resp" ];
			then echo error bind $unit $i to $unit
			echo $resp1
			echo $resp
		fi	


	# #unbind_driver
	# params='{"resourceId":'$resource',"driverId":'$i',"time":0,"unitId":'$unit',"mode":false}'
	# resp=`curl -s "$server?svc=resource/bind_unit_driver&sid=$sid" --data-urlencode "params=$params"`
	# 	#echo $resp			   
	# 	mresp='{}'
	# 	#echo $mresp
	# 	if [ "$mresp" != "$resp" ];
	# 		then echo error bind $unit $i to $unit
	# 		echo $resp1
	# 		echo $resp
	# 	fi	


	done
done
done