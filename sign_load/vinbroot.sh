#!/bin/bash

for (( i=0; i<10; i++ ))
do {
	for (( j=0; j<10; j++ ))
	do {
		params='{"vin":"XWFPF2D11C00272'$i''$j'"}'
		resp=`curl -s "https://hst-api.wialon.com/wialon/ajax.html?svc=unit/get_vin_info&sid=02b2e89e628a55c217afcfeb8be28544" --data-urlencode "params=$params"`
		echo $params "@@@@@" $resp
		#if [ "$i" = "5" ];
		#	then if [ "$j" = "5" ];
		#		then echo $i$j
		#	fi
		#fi
	} done;
} done;