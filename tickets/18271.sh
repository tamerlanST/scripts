#!/bin/bash

# custom
server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
sid='02eaff5e51a3a1af4daf615c018cb59a'
svc='report/update_report'

cp='"cp":"[\"\",{},{\"p\":\"mcoef\",\"m\":\"миш\"},{},{\"p\":\"mcoef\",\"m\":\"миш1\"},{}]'


trips='{"l":"Поездки","c":"[\"time_begin\",\"user_column\",\"time_end\",\"user_column\"]","n":"unit_trips","cl":"[\"Начало\",\"кастом1\",\"Конец\",\"кастом2\"]","sl":"","s":"","f":4368,"sch":{"y":0,"m":0,"w":0,"f1":0,"f2":0,"t1":0,"t2":0},"p":"",$cp}'

params='{"n":"18271","ct":"avl_unit","p":"{\"bind\":null}","tbl":['$trips'],"id":13,"itemId":70643,"callMode":"update"}'
resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
echo $resp
