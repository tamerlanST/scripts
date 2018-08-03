#!/bin/bash

if [ "$1" != "" ]; then
	echo "one module update mode"
	
	check=`ls | grep $1`
	if [ "$check" = "" ]; then
		echo "there are no $1 module"
	else 
		echo en_$folder > $1/descr_en.txt; cat $1/descr_en.txt
		echo ru_$folder > $1/descr_ru.txt; cat $1/descr_ru.txt 
	fi

else

	echo "full update mode"
	for folder in activex cms hw.ack hw.atrack hw.galileosky hw.mintrans_rf hw.teltonika maintenance reports skin wialon adf dep hw.airunner hw.balakirevskij_zavod_ehlektronnoj_tehniki hw.gosafe hw.queclink_wireless_solutions i18n messages resources stats adf_scripts drivers hw.amity hw.baltic_car_equipment hw.gurtam hw.ruptela jobs mobile2 retranslators tabs agro fonts hw.aplicom hw.blueberry_technology hw.haicom hw.satellite_solutions log nimbus routes tags backup hw.2_track hw.arknav hw.box_telematics hw.iridium hw.skypatrol logistics notifications samaps utility base hw.3d_telemetrija hw.atomika hw.common hw.meitrack hw.skywave_mobile_communications mail npm sdk versions ; do
		echo en_$folder > ../tmp/local_updates/1523552557077/$folder/descr_en.txt; cat ../tmp/local_updates/1523552557077/$folder/descr_en.txt
		echo ru_$folder > ../tmp/local_updates/1523552557077/$folder/descr_ru.txt; cat ../tmp/local_updates/1523552557077/$folder/descr_ru.txt
	done 

fi