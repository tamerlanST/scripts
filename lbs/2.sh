for i in {1..20}; do
	echo $i
	gnome-terminal -e "./1.sh $SHELL" &
done

wait
