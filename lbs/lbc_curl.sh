#!/bin/bash
b=0
e=0
time=$(date +%s)
for i in {1010..2010}; do {
	old_lbs=`curl -s "http://lbs-svcs.wialon.com/?get_pos=\{\"points\":\[\{\"mcc\":262,\"mnc\":2,\"lac\":1${i},\"cell_id\":2${i}0\},\{\"mcc\":262,\"mnc\":${i},\"lac\":${i},\"cell_id\":28260\},\{\"mcc\":2${i},\"mnc\":2,\"lac\":148,\"cell_id\":28260\},\{\"mcc\":${i},\"mnc\":2,\"lac\":148,\"cell_id\":28260\},\{\"mcc\":262,\"mnc\":2,\"lac\":${i},\"cell_id\":28260\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":${i}60\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":2${i}0\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":26${i}\}\]\}";`	
#	new_lbs=`curl -s "http://lbs-svcs.wialon.com/?get_pos=\{\"points\":\[\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":28260\}\]\}";`	
	new_lbs=`curl -s "http://10.3.3.122:8001/?get_pos=\{\"points\":\[\{\"mcc\":262,\"mnc\":2,\"lac\":1${i},\"cell_id\":2${i}0\},\{\"mcc\":262,\"mnc\":${i},\"lac\":${i},\"cell_id\":28260\},\{\"mcc\":2${i},\"mnc\":2,\"lac\":148,\"cell_id\":28260\},\{\"mcc\":${i},\"mnc\":2,\"lac\":148,\"cell_id\":28260\},\{\"mcc\":262,\"mnc\":2,\"lac\":${i},\"cell_id\":28260\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":${i}60\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":2${i}0\},\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":26${i}\}\]\}";`
#	old_lbs=`curl -s "http://10.3.3.122:8001/?get_pos=\{\"points\":\[\{\"mcc\":262,\"mnc\":2,\"lac\":148,\"cell_id\":28260\}\]\}";`
	if [ "$new_lbs" != "$old_lbs" ]
	then 
		echo "Несоответствие при i="$i 1>>report.txt
		echo "new"$new_lbs 1>>report.txt
		echo "old"$old_lbs 1>>report.txt
		let e=e+1	
	fi
	
	if [ "$new_lbs" != "{\"points\":[{}, {}, {}, {}, {}, {}, {}, {}]}" ]
	then 
		let b=b+1
	else
		echo $i	
	fi
} 
done;
echo "Координат найдено "$b
echo "Нестыковок найдено "$e
echo "Выполнено за "$(($(date +%s)-$time))" с."










