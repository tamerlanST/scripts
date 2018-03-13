#!/bin/bash
for i in {1..1}; do
	./19594_fromfile.sh $i  &
done

wait