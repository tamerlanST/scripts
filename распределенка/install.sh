#!/bin/bash

if [[ $1 == "" || ( $1 != "adf" && $1 != "deps" && $1 != "cms" && $1 != "sdk" && $1 != "hw" && $1 != "self-update" && $1 != "status" && $1 != "stat" ) ]]
then
	echo -ne "==================================================================================\n"
	echo -ne "You must choose the part to update \n"
	echo -ne "    usage: ./install.sh [deps|adf|cms|sdk|hw] <branch> \n"
	echo -ne "Set branch if need to use not a master branch. It works only for adf, cms and sdk. \n"
	echo -ne "Rarely to update dependency may to use 'expract|make' with/without name of packet \n"
	echo -ne "If you wan't to self-update then use: ./install.sh self-update\n"
	echo -ne "If you forgot branch use: ./install.sh status\n"
	echo -ne "==================================================================================\n"
	exit 0
fi

# Script name
script_name=`basename $0`

# Path to script work folder
script_path=`cd $(dirname $0) && pwd`

# History filename
branch_file=".install_sh.db"

cd $script_path

#====================================
# @usage: history_save <mode> <branch>
#====================================
function history_save {
    if [[ ! -f $branch_file ]]; then
        touch $branch_file
    fi

    if [[ $1 == "adf" || $1 == "deps" || $1 == "cms" || $1 == "sdk" || $1 == "hw" ]]; then
        sed -i "/$1:/d" "$branch_file"
        echo "$1:$2" >> "$branch_file"
    fi
}

#====================================
# @usage: history_show <mode>
#====================================
function history_show {
    if [[ -f $branch_file ]]; then
        cat $branch_file
    else
        echo "History file not exists"
    fi
}

#=============================
# Self upgrade method
#=============================
if [ $1 == "self-update" ]; then
    curl -s https://git.gurtam.net/kist/install.sh/raw/master/install.sh > $script_name

    if [ $? -eq 0 ]; then
        echo "Self-update successful"
    fi

    exit 0;
fi

history_save "$1" "$2"

#=============================
# Other
#=============================
case "$1" in
"deps" )
	echo "Updating dependences";

    if [[ $2 == "master" ]]; then
		ssh hosting@qa1.test.gurtam.net "/home/hosting/projects/hosting/remote_build/make_deps.sh install"
		rsync -lrvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/adf/dep-src/dep .

    elif [[ $2 == "debug" ]]; then
		ssh hosting@qa1.test.gurtam.net "/home/hosting/projects/hosting/remote_build_debug/make_deps.sh install"
		rsync -lrvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build_debug/adf/dep-src/dep .
    else
		echo "Choose $1 correct branch [master|debug]"
    fi
    ;;
"adf" )
	echo "Updating ADF modules"
	
	if [[ $2 == "master" ]]; then
        echo "Upload files from 'master' directory"
        ssh hosting@qa1.test.gurtam.net "/home/hosting/projects/hosting/remote_build/make_adf.sh $2"
        rsync -rvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/build .
        rsync -rvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/adf/plugins .
        rsync -rvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/adf/scripts .
        rsync -rvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/adf/sites .
        rsync hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/shell .

	elif [[ $2 == "debug" ]]; then	  
        echo "Upload files from 'debug' directory"
        ssh hosting@qa1.test.gurtam.net "/home/hosting/projects/hosting/remote_build_debug/make_adf.sh $2"
        rsync -rvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build_debug/build .
        rsync -rvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build_debug/adf/plugins .
        rsync -rvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build_debug/adf/scripts .
        rsync -rvaS hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build_debug/adf/sites .
        rsync hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build_debug/shell .
    else
		echo "Choose $1 correct branch [master|debug]"
	fi

	if [[ -f './wialon.sh' ]]; then
		./wialon.sh restart
	fi
    ;;
"cms" )
	echo "Updating CMS plugin"
    ssh hosting@qa1.test.gurtam.net "/home/hosting/projects/hosting/remote_build/update_cms.sh $2"

    # Check if branch not exists
    if [[ $? -eq 30 ]]; then
        exit
    fi

	rsync -rvaS --exclude "- .gitignore" --exclude "- .git/" --delete --delete-excluded hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/cms .

	if ! [[ -d "common" ]]
	then
		mkdir common
	fi
	cd common
	rsync -rvaS --exclude "- .gitignore" --exclude "- .git/" --delete --delete-excluded hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/common/wialon_i18n .
	rsync -rvaS --exclude "- .gitignore" --exclude "- .git/" --delete --delete-excluded hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/common/fonts .
	cd ..

	dir_before=$(pwd)
	cd cms/cms/www
	ln -s ${dir_before}/common/fonts .
	cd ${dir_before}

	if ! [[ -d "custom" ]]
	then
		mkdir custom
	fi
	cd custom
	rsync -rvaS --exclude "- .gitignore" --exclude "- .git/" --delete --delete-excluded hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/custom/skins .
	cd ..
    ;;
"sdk" )
	echo "Updating SDK"
    ssh hosting@qa1.test.gurtam.net "/home/hosting/projects/hosting/remote_build/make_sdk.sh $2"

	if ! [[ -d wdc ]]
	then
		mkdir wdc
	fi
	cd wdc
        rsync -rvaS --exclude "- .gitignore" --exclude "- .git/" --delete --delete-excluded hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/wdc/sdk_js .
	cd ..
        rsync -rvaS --exclude "- .gitignore" --exclude "- .git/" --delete --delete-excluded hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/ext .
    ;;
"hw" )
	echo "Updating hw scripts"
    ssh hosting@qa1.test.gurtam.net "/home/hosting/projects/hosting/remote_build/update_hw.sh"
	if ! [[ -d wdc ]]
	then
		mkdir wdc
	fi
	cd wdc
        rsync -rvaS --exclude "- .gitignore" --exclude "- .git/" --delete --delete-excluded hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/wdc/hw .
	cd ..
	;;
"license" )
	echo "Updating License"
    ssh hosting@qa1.test.gurtam.net "/home/hosting/projects/hosting/remote_build/update_license.sh"
	if ! [[ -d other ]]
	then
		mkdir other
	fi
	cd other
    rsync -rvaS --exclude "- .gitignore" --exclude "- .git/" --delete --delete-excluded hosting@qa1.test.gurtam.net:/home/hosting/projects/hosting/remote_build/other/license .
	cd ..
    ;;
"status" | "stat" )
    history_show
    ;;

esac

exit 0

