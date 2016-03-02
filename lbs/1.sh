#!/bin/bash
time=$(date +%s)
for i in {1000..1500}; do 
	echo $i && 
	#http://dzvi.dev/dzvi/lbs_service/www/
	curl "http://lbs-svcs.wialon.com/?get_pos=\{\"points\":\[\{\"mcc\":262,\"mnc\":2,\"lac\":1${i},\"cell_id\":2${i}0\},\{\"mcc\":262,\"mnc\":${i},\"lac\":${i},\"cell_id\":28260\},\{\"mcc\":2${i},\"mnc\":2,\"lac\":148,\"cell_id\":28260\},\{\"mcc\":${i},\"mnc\":2,\"lac\":148,\"cell_id\":28260\},\{\"mcc\":262,\"mnc\":2,\"lac\":${i},\"cell_id\":28260\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":${i}60\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":2${i}0\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":26${i}\}\]\}" -s -w %{time_total}\\n;
	#curl "http://10.192.134.128:8001/?get_pos=\{\"points\":\[\{\"mcc\":262,\"mnc\":2,\"lac\":1${i},\"cell_id\":2${i}0\},\{\"mcc\":262,\"mnc\":${i},\"lac\":${i},\"cell_id\":28260\},\{\"mcc\":2${i},\"mnc\":2,\"lac\":148,\"cell_id\":28260\},\{\"mcc\":${i},\"mnc\":2,\"lac\":148,\"cell_id\":28260\},\{\"mcc\":262,\"mnc\":2,\"lac\":${i},\"cell_id\":28260\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":${i}60\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":2${i}0\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":26${i}\}\]\}" -s -w %{time_total}\\n;
done;
echo $(($(date +%s)-$time))

read

