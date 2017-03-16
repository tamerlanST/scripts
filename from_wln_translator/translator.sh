#!/bin/bash
server='http://web.wia.test.gurtam.net/wialon/ajax.html'
sid='3f999abb6ad019838a8f94f4c8cc5005'
unitID='127'
delay='70s'

#cat messages file
cat wln.wln | while read line
	do
	msg="$line"
	echo $msg > tmp.wln
	#cat tmp.wln

	# import message
	params='{"itemId":'$unitID',"eventHash":"fish"}'	  
	resp=`curl -sX POST -F "params=$params" -F "filename=@tmp.wln" "$server?svc=exchange/import_messages&sid=$sid"`
		#echo $resp
		mresp='{}'
		#echo $mresp
		if [ "$mresp" != "$resp" ];
			then echo "error"
			else echo "success import: $line"
		fi
	rm tmp.wln
	sleep $delay
	done
exit 0
