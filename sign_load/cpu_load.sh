#!/bin/bash	
rm -rf res
mkdir res

s1='dbmain'
s2='api0'
s3='nginx'

s4='webauth1'
s5='api1_1'
s6='api1_2'
s7='api2_1'
s8='api2_2'

#sleep 10

for (( i=1; i<41; i++ ))
do
	#old nginx
	if [ "$1" = "old" ];
	then 
		ps1=`ps axo pid,command | grep adf | grep $s1 | awk '{print $1}'`
		top -b -n 1 | grep $ps1 | awk '{print $9}' >> res/$s1.txt
		ps2=`ps axo pid,command | grep adf | grep $s2 | awk '{print $1}'`
		top -b -n 1 | grep $ps2 | awk '{print $9}' >> res/$s2.txt
		ps3=`ps axo pid,command | grep master | grep $s3 | awk '{print $1}'`
		top -b -n 1 | grep $ps3 | awk '{print $9}' >> res/$s3.txt	
    fi
    	
	#new ngx
   	if [ "$1" = "new" ];
   	then 
   		ps4=`ps axo pid,command | grep adf | grep $s4 | awk '{print $1}'`
		top -b -n 1 | grep $ps4 | awk '{print $9}' >> res/$s4.txt
		ps5=`ps axo pid,command | grep adf | grep $s5 | awk '{print $1}'`
		top -b -n 1 | grep $ps5 | awk '{print $9}' >> res/$s5.txt
		ps6=`ps axo pid,command | grep adf | grep $s6 | awk '{print $1}'`
		top -b -n 1 | grep $ps6 | awk '{print $9}' >> res/$s6.txt
		ps7=`ps axo pid,command | grep adf | grep $s7 | awk '{print $1}'`
		top -b -n 1 | grep $ps7 | awk '{print $9}' >> res/$s7.txt
		ps8=`ps axo pid,command | grep adf | grep $s8 | awk '{print $1}'`
		top -b -n 1 | grep $ps8 | awk '{print $9}' >> res/$s8.txt
		ps1=`ps axo pid,command | grep adf | grep $s1 | awk '{print $1}'`
		top -b -n 1 | grep $ps1 | awk '{print $9}' >> res/$s1.txt
	fi

    sleep 1
done;

