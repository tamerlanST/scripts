#!/bin/bash
server='http://qa2.test.gurtam.net:8021/wialon/ajax.html'
svc='user/send_sms'
sid=`curl -s "$server?svc=core/login&params=\{\"user\":\"rapi\",\"password\":\"rapi\"\}" | jq '.["eid"]' | cut -c2-33`
compliment='Наши дорогие и любимые! 7 марта - это праздник перед праздником, и мы хотели бы отметить его вместе с вами. Настоящие мужчины ждут прекрасных женщин в 16.00 на кухне, чтобы посвятить вам этот вечер.'

#test - stan number
#phoneNumber="+375297818810"


#cat phone base file
cat numbers.txt | while read line
	do
	phoneNumber="+$line"
	echo $phoneNumber

	# send sms with compliment
	params='{"phoneNumber":"'$phoneNumber'","smsText":"'$compliment'"}'
	resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
		echo $resp
		mresp='{}'
		echo $mresp
		if [ "$mresp" != "$resp" ];
			then error
			else 
				echo "sms was successfully send to number $phoneNumber"
		fi

	done

exit 0
