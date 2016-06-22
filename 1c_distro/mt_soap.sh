#!/bin/bash
for i in {1..128}; do
	#x=1000
	echo "$i stan.test"
	#n1=$(($i*$x-$x+1))
	#n2=$(($n1+$x-1))
	#echo "From" $n1 "to" $n2
	php soap_connect.php  &
done

wait
