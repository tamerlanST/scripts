#!/bin/bash
for i in {1..10}; do
	echo $i
	./sign.sh &
done

wait