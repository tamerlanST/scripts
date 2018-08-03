#!/bin/bash

if [[ $1 == "" ]]
then
	echo "usage - ./lic_test_update.sh branch_name" 
else
	git clone git@git.gurtam.net:wdc/license.git
	cd license
	git fetch --all
	git checkout $1
	git pull --rebase origin $1
	echo "start sync from $1 branch" 
	rsync --quiet --delete -av . wdc@qa4.test.gurtam.net:/home/wdc/services/license-test/other/license/license
	echo "###########################################################"
	echo "sync done, BTC donation: 33psKjWnPjr2dzHfPBmU5xXmh5AoHLdWCx" 
	cd ../
	rm -rf license
fi
