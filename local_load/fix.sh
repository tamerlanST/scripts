time='1500000000'
cat local_load_unit-10000.txt | while read line
	do
		let "time = time + 1"
		echo $line | sed 's/REG;[0-9]*;/REG;'$time';/g' >> 1s.txt
	done