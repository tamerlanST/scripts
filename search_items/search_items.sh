#!/bin/bash

server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
svc='item/update_custom_property'
sid='026e20bb18a0ca89a00d62b6ef5d99cf'
params='{"itemId":477039,"name":"sensors_colors","value":"0 fcf8a9;200 000000"}'
resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
	echo $resp
	mresp=''
	echo $mresp
	#if [ "$mresp" != "$resp" ];
	#	then echo
	#fi