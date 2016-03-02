#!/bin/bash
for i in {1..1}; do
	echo $i
	./weblog_img.sh &
	./weblog_url.sh &
done

wait