#!/bin/bash
for i in {1..1}; do
	echo $i
	./blog_img.sh &
	./blog_url.sh &
done

wait