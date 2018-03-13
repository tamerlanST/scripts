#!/bin/bash


server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
svc='resource/reg_drv_tacho_activity'
sid='02b73c2d08e7bdb754374f83cbf25c56'

#activitys
# 0 - rest
# 1 - reserv
# 2 - work
# 3 - driving


tm="2017-11-06 17:00"
activity="0"
distance="0"
duration="0"

time=`date -d "$tm" "+%s"`



params='{"resourceId":"70643","driverId":"2","time":"'$time'","activity":"'$activity'","distance":"'$distance'","duration":"'$duration'","force":1}'
#resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
echo $params >> 19594.data

#echo $activity $tm $time $resp
