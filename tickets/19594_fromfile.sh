#!/bin/bash


server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
params='{"user":"load","password":"load"}'
sid=`curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login" --data-urlencode "params=$params" | jq .eid | cut -c2-33`
echo $sid


#activitys
# 0 - rest
# 1 - reserv
# 2 - work
# 3 - driving

i=1

			params1='{"resourceId":"3007502","driverId":"'$i'","time":"1509944400","activity":"2","distance":"10","duration":"0","force":1}'
			params2='{"resourceId":"3007502","driverId":"'$i'","time":"1509945300","activity":"3","distance":"10","duration":"0","force":1}'
			params3='{"resourceId":"3007502","driverId":"'$i'","time":"1509957900","activity":"2","distance":"20","duration":"0","force":1}'
			params4='{"resourceId":"3007502","driverId":"'$i'","time":"1509958800","activity":"0","distance":"20","duration":"0","force":1}'
			params5='{"resourceId":"3007502","driverId":"'$i'","time":"1509962400","activity":"1","distance":"20","duration":"0","force":1}'
			params6='{"resourceId":"3007502","driverId":"'$i'","time":"1509966000","activity":"3","distance":"20","duration":"0","force":1}'
			params7='{"resourceId":"3007502","driverId":"'$i'","time":"1509976800","activity":"0","distance":"30","duration":"0","force":1}'
		

		svc='resource/reg_drv_tacho_activity'
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params1"`
		echo $resp
		sleep 1
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params2"`
		echo $resp
		sleep 1
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params3"`
		echo $resp
		sleep 1
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params4"`
		echo $resp
		sleep 1
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params5"`
		echo $resp
		sleep 1
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params6"`
		echo $resp
		sleep 1
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params7"`
		echo $resp
		sleep 1





