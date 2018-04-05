#!/bin/bash
sid='2bf2177a758273f16fcb255e737a7dec'
server='web.qa3.test.gurtam.net/wialon/ajax.html'
#creatorId='14'
creatorId='14'
hwTypeId='4'
utm=`date +%s`
billing_plan_name='load_billing'
resource_iterator='100'
unit_iterator='100'
sensor_iterator='20'

if [[ $1 == "" ]]; then
	echo "Created by stan, 2018."
	echo "Usage:"
	echo "./create_units.sh <create|delete|fuel>"
fi	

if [[ $1 == "create" ]]; then
echo "Create mode"
for (( i=1; i<=$resource_iterator; i++ )); do
	#create_child_user
	svc=core/create_user
	params='{"creatorId":'$creatorId',"name":"'load$i'","password":"child","dataFlags":5}'
	resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params" | sed 's/"crt":[^"]*,//g' | sed 's/"bact":[^"]*,//g'`
	userId=`echo $resp | jq '.item.id'`
	echo userId=$userId
	#echo $resp
		mresp='{"item":{"nm":"'load$i'","cls":1,"id":'$userId',"mu":0,"uacl":-1},"flags":5}'
		#echo $mresp
		if [ "$mresp" != "$resp" ];
			then echo "Это фиаско создания пользователя, братан."
		fi

	#create resource
	svc='core/create_resource'
	params='{"creatorId":'$userId',"name":"'load$i'","skipCreatorCheck":0,"dataFlags":5}'
	resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params" | sed 's/"bact":[^"]*,//g'`
	resourceId=`echo $resp | jq '.item.id'`
	echo resourceId=$resourceId
	echo $resourceId >> .resids.log
	#echo $resp
		mresp='{"item":{"nm":"'load$i'","cls":3,"id":'$resourceId',"crt":'$userId',"mu":0,"bpact":0,"uacl":-1},"flags":5}'
		#echo $mresp
		if [ "$mresp" != "$resp" ];
			then echo "Это фиаско создания ресурса, братан."
		fi

	#create account
	svc='account/create_account'
	params='{"itemId":'$resourceId',"plan":"'$billing_plan_name'"}'
	resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
	#echo $resp
		mresp='{}'
		#echo $mresp
		if [ "$mresp" != "$resp" ];
			then echo "Это фиаско создания учетной записи, братан."
		fi

		#create_units
		n1=$(($i*$unit_iterator-$unit_iterator+1))
		n2=$(($n1+$unit_iterator-1))
		echo "From" $n1 "to" $n2
		for (( j=$n1; j<=$n2; j++ )); do		

			#create_unit
			svc='core/create_unit'
			params='{"creatorId":'$userId',"name":"local_load_unit'$i'_'$j'","hwTypeId":'$hwTypeId',"dataFlags":1}'
			resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
			unitId=`echo $resp | jq '.item.id'`
			echo $unitId >> .unitids.log
			#echo $resp
				mresp='{"item":{"nm":"local_load_unit'$i'_'$j'","cls":2,"id":'$unitId',"mu":0,"uacl":-1},"flags":1}'
				#echo $mresp
				if [ "$mresp" != "$resp" ];
					then echo "Это фиаско создания объекта, братан!!!"
				fi

			#set unique id
			svc='unit/update_device_type'
			params='{"itemId":'$unitId',"deviceTypeId":"4","uniqueId":"local_load_unit_'$j'"}'
			resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
			#echo $resp
				mresp='{"uid":"local_load_unit_'$j'","hw":4,"hwd":0}'
				#echo $mresp
				if [ "$mresp" != "$resp" ];
					then echo "Это фиаско установки типа оборудования объекта, братан!!!"
				fi
		done	
done
fi

if [[ $1 == "delete" ]]; then
	echo "Delete mode"
	while read LINE; do 
		#delete account with units
		svc='account/delete_account'
		params='{"itemId":'$LINE'}'
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
		#echo $resp
			mresp='{}'
			#echo $mresp
			if [ "$mresp" != "$resp" ];
				then echo "Это фиаско удаления учетных записей с объектами, братан!!!"
			fi
	done < .resids.log
	rm .resids.log
	rm .unitids.log
fi

if [[ $1 == "fuel" ]]; then
	echo "Fuel mode"
	while read LINE; do 
		#add fuel sensor
		svc='core/batch'
		params='{"params":[{"svc":"unit/update_sensor","params":{"n":"fuel","t":"fuel level","d":"","m":"l","p":"adc12","f":0,"c":"{\"appear_in_popup\":true,\"show_time\":false,\"pos\":1,\"cm\":0,\"validate_driver_unbound\":0,\"unbound_code\":\"\",\"mu\":\"0\",\"act\":1,\"uct\":0,\"timeout\":0,\"ci\":{}}","vt":1,"vs":0,"tbl":[],"id":0,"itemId":'$LINE',"callMode":"create"}},{"svc":"unit/update_fuel_calc_types","params":{"itemId":'$LINE',"calcTypes":2}}],"flags":0}'
		resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
		echo $resp
			mresp='[[1,{"id":1,"n":"fuel","t":"fuel level","d":"","m":"l","p":"adc12","f":0,"c":"{\"act\":1,\"appear_in_popup\":true,\"ci\":{},\"cm\":0,\"mu\":\"0\",\"pos\":1,\"show_time\":false,\"timeout\":0,\"uct\":0,\"unbound_code\":\"\",\"validate_driver_unbound\":0}","vt":1,"vs":0,"tbl":[]}],{}]'
			echo $mresp
			if [ "$mresp" != "$resp" ];
				then echo "Это фиаско добавления датчика в объект $LINE, братан!!!"
			fi
	done < .unitids.log		
fi

if [[ $1 == "sensors" ]]; then
	echo "mnogo sensors mode"
	while read LINE; do
		for (( i=11; i<=$sensor_iterator; i++ )); do 
			#custom sensor
			svc='unit/update_sensor'
			params='{"n":"s'$i'","t":"custom","d":"","m":"km","p":"(adc12*const7+const3.5/const7)^(const0.5)","f":0,"c":"{\"appear_in_popup\":true,\"show_time\":false,\"pos\":4,\"cm\":0,\"validate_driver_unbound\":0,\"unbound_code\":\"\",\"mu\":\"0\",\"act\":1,\"uct\":0,\"timeout\":0,\"ci\":{}}","vt":1,"vs":0,"tbl":[],"id":0,"itemId":'$LINE',"callMode":"create"}'
			fresp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
			resp=`echo $fresp | jq .[1].n`
			echo $LINE $resp
				mresp='"s'$i'"'
				echo $mresp
				if [ "$mresp" != "$resp" ];
					then echo "Это фиаско добавления $i кастомного датчика в объект $LINE, братан!!!"
					echo $fresp
				fi
			sleep 0.01	
		done				
	done < .unitids.log		
fi
