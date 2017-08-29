#!/bin/bash

ld_path=${LD_LIBRARY_PATH}
path=${PATH}
hosting_home="/home/GURTAM/kaan/projects/hosting"
declare -a services=("api" "dbmain" "db1" "db2" "backup.db1" "backup.db2" "hw" "task" "task4")
 #"webauth"

restart_service () {
	cd ${hosting_home}
		cd ${hosting_home}/$1
		pwd
		./adf_script stop
		./adf_script start $1
		echo "======================"
}

start_service () {
	cd ${hosting_home}
		cd ${hosting_home}/$1
		pwd
		./adf_script start $1
		echo "======================"
}

stop_service () {
	cd ${hosting_home}
		cd ${hosting_home}/$1
		pwd
		./adf_script stop
		echo "======================"
}

if [[ $1 = "restart" ]]
	then
	for i in "${services[@]}"
		do
		   restart_service $i
	done
fi

if [[ $1 = "start" ]]
	then
	for i in "${services[@]}"
		do
		   start_service $i
	done
fi

if [[ $1 = "stop" ]]
	then
	for i in "${services[@]}"
		do
		   stop_service $i
	done
fi
