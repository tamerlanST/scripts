#!/bin/bash
for i in {1..3}; do
	x=3
	n1=$(($i*$x-$x+1))
	n2=$(($n1+$x-1))
	echo "From" $n1 "to" $n2
	
	for (( j=$n1; j<=n2; j++ )); do
		echo j=$j
	done

done