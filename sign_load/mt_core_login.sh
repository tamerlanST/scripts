#!/bin/bash
for i in {1..192}; do
	x=200
	echo "$i stan.test"
	n1=$(($i*$x-$x+1))
	n2=$(($n1+$x-1))
	#echo "From" $n1 "to" $n2
	./core_login.sh $n1 $n2 $i  &
done

wait
