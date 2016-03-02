#!/bin/bash
for i in {1..$1}; do
	echo $i
	./forum_img.sh &
	./forum_pid.sh &
done

#wait