#!/bin/bash
#login
server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
params='{"user":"stan","password":"stan"}'
sid=`curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login" --data-urlencode "params=$params" | jq .eid | cut -c2-33`
echo $sid


for i in {1..100}; do
#create_resource
svc='core/create_resource'
params='{"creatorId":70642,"name":"19594tacho'$i'","skipCreatorCheck":1,"dataFlags":1}'
resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
echo resp=$resp
id=`echo $resp | jq .item.id`
echo id=$id
	mresp='{"item":{"nm":"19594tacho'$i'","cls":3,"id":'$id',"mu":0,"uacl":-1},"flags":1}'
 	#echo $mresp
 	if [ "$mresp" != "$resp" ];
 		then echo $i is not exist
 	fi	
echo $id >> resources_ids.log
done

echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
cat resources_ids.log
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#add to autobind list
while read resid; do 
svc='resource/update_driver_units'
params='{"itemId":'$resid',"units":[1060367,1060369,1060372,1060356,1060374]}'
resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
echo $resp
done < resources_ids.log


echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
cat resources_ids.log
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#create_drivers
while read resid; do 
	for i in {1..100}; do
		for code in 0000000056912000 0000000004622001 0000000063539000 0000000039495000 0000000071665000 0000000101120000 0000000071213000 0000000097347000 0000000100860000 RUD0000040169900
		do

		params='{"c":"'$code'","ck":0,"ds":"","id":0,"n":"'$code$i'","p":"","r":0,"f":0,"pwd":"","jp":{},"itemId":'$resid',"callMode":"create"}'
		echo $params
		resp=`curl -s "$server?svc=resource/update_driver&sid=$sid" --data-urlencode "params=$params"`
			echo $resp
			#mresp='['$i',{"id":11,"n":"Новый водитель","c":"","jp":{},"ej":{},"pwd":"","ds":"","p":"","r":0,"f":1,"ck":0,"bu":0,"pu":0,"bt":0,"bs":0,"pos":{"y":0,"x":0}}]'
			#echo $mresp
			#if [ "$mresp" != "$resp" ];
			#	then echo $i is not exist
			#fi	

		done
	done
done < resources_ids.log

#rm resources_ids.log



# # delete_driver
# params='{"itemId":633468,"id":'$i',"callMode":"delete"}'
# resp=`curl -s "$server?svc=resource/update_driver&sid=$sid" --data-urlencode "params=$params"`
# 	#echo $resp
# 	mresp='['$i',null]'
# 	#echo $mresp
# 	if [ "$mresp" != "$resp" ];
# 		then echo $i is not exist
# 	fi		

