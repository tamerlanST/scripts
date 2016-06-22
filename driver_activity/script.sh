#!/bin/bash

pattern1='[0-9], [0-9]* |'
pattern2='([0-9]*:[0-9]*:[0-9]*)'

#first_part=$(cat $1 | grep -o pattern1)
#second_part=$(cat $1 | grep -o pattern2)

while read line; do
	str1=$(echo "$line" | grep -o '[0-9],.* |' | grep -o "[0-9]*, [0-9]*")
  #str1=$( echo "$line" | cut -d ':' -f 7 )
  	str2=$(echo "$line" | grep -o '([0-9]*:[0-9]*:[0-9]*)')
  #str2=$( echo "$line" | cut -d ':' -f 8-10 | cut -c 12-21 )
  echo "${str1} ${str2}"
done < $1 