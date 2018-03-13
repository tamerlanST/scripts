#!/bin/bash

# create_zone

server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
svc='resource/update_zone'
sid='022fba9b7199c40491769781e5814d34'

for i in {1..10000}; do
	params='{"n":"1","d":"Одинцова ул., 49, Минск, Беларусь","t":2,"w":0,"f":48,"c":2568583984,"tc":16733440,"ts":12,"min":0,"max":18,"libId":"","path":"","p":[{"x":27.4428832507,"y":53.8965610512,"r":0},{"x":27.448033092,"y":53.8887717305,"r":0},{"x":27.459877727,"y":53.8908962347,"r":0}],"itemId":929478,"id":0,"callMode":"create"}'
	resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
	echo $resp

done