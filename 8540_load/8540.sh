rm -rf orange.txt
for i in {1..10}; do
	echo $i
	./orange.sh &
done

wait