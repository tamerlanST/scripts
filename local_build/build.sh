#!/bin/bash
# wdc/local1804 build script

DEFAULT_PARTS="local_modules avd_mapper adf sdk_js hw wialon_i18n wialon_mobile2 cms fonts local_skins logistics"

if [[ $* == *--help* ]]; then
	echo "Usage:"
	echo "./build.sh [<branch>] [ <part> <part> ... ]"
	echo "    branch - stable or debug (default)"
	echo "    part'S - list of modules to update from GIT, default: $DEFAULT_PARTS"
	exit 1
fi

# colors
red='\e[0;31m'
green='\e[0;32m'
# blue='\e[0;34m'
NC='\e[0m'

# source common functions & vars
. /home/compile/build/common.sh

# lock "mutex" for this script
op_lock
if [ "$OP_LOCKED" != "1" ]; then
	exit 1
fi

BRANCH="$1"
if [ -z "$BRANCH" ]; then
	BRANCH="debug"
fi
if [ "$BRANCH" != "debug" ] && [ "$BRANCH" != "stable" ]; then
	echo "Building wdc/local1804: wrong branch '$BRANCH'"
	exit 1
fi
shift
echo "Building wdc/local1804 of branch $BRANCH"

PARTS="$*"

if [ -z "$PARTS" ]; then
	PARTS="$DEFAULT_PARTS"
fi

echo "Parts: $PARTS"

# log_action "building wdc/local, BRANCH=$BRANCH, PARTS=$PARTS"

# Working directory
WDIR="${build_root}/wdc/local1804"
# Build directory
BDIR="${WDIR}/tree/$BRANCH"
FILES_LIST="files.list"
GZIPIT_FILE="gzip.it"
SUBMODULE_FILE="sub.it"
BUILDS_VER_FILE="builds.txt"
BUILDS_VER_MODULE="versions_temp"
BUILDS_VER_PATH="${BDIR}/${BUILDS_VER_MODULE}/${BUILDS_VER_FILE}"

# ckeck build dir
if ! [ -d ${BDIR} ]; then
	mkdir -p ${BDIR}
fi

# check build versions module dir
if ! [ -d "${BDIR}/${BUILDS_VER_MODULE}" ]; then
        mkdir "${BDIR}/${BUILDS_VER_MODULE}"
fi

# fill builds_ver
if [ -f ${BUILDS_VER_PATH} ]; then
	rm ${BUILDS_VER_PATH}
fi

# write datetime build
CUR_DATE=$(date +"%Y-%m-%d %H:%M")
echo "Wialon Local 1804 (build: ${CUR_DATE})
" > ${BUILDS_VER_PATH}


# Generating Local Admin #
if [[ $PARTS == *local_modules* ]]; then
	echo -e "Processing <${green}Local Admin${NC}> ..."
	cd "${WDIR}/local_modules"
	# fetch updates from git
	GIT_MERGE_AUTOEDIT=no git pull
fi
git show HEAD | head -n 1 | sed "s/commit/local_modules/g" >> ${BUILDS_VER_PATH}

# Generating avd_mapper #
if [[ $PARTS == *avd_mapper* ]]; then
	echo -e "Processing <${green}AVD Mapper${NC}> ..."
	cd "${WDIR}/avd_mapper"
	# fetch updates from git
	GIT_MERGE_AUTOEDIT=no git pull
fi
git show HEAD | head -n 1 | sed "s/commit/avd_mapper/g" >> ${BUILDS_VER_PATH}

# Generating ADF #
if [[ $PARTS == *adf* ]]; then
	echo -e "Processing <${green}ADF${NC}> ..."
	cd "${WDIR}/adf"
	# fetch updates from git
	GIT_MERGE_AUTOEDIT=no git pull
fi
git show HEAD | head -n 1 | sed "s/commit/adf/g" >> ${BUILDS_VER_PATH}

# build dep if need
if [ ! -e "${WDIR}/dep" ]; then
	echo -e "Extracting and building <${green}dep${NC}> ..."
	cd "${WDIR}/adf/dep-src"
	./make_deps.sh extract all
	./make_deps.sh make all
	cd "${WDIR}"
	ln -s adf/dep-src/dep
fi

# build adf
if [[ $PARTS == *adf* ]]; then
	cd ${WDIR}
        make all 1> /dev/null
        if [[ ${?} != 0 ]]; then
                echo -e "Fail to build module <${red}ADF${NC}>"
                exit 1
        fi
fi

# Generating SDK_JS #
if [[ $PARTS == *sdk_js* ]]; then
	# fetch updates from git
	cd "${WDIR}/sdk_js"
	echo -e "Processing <${green}SDK_JS${NC}> ..."
	GIT_MERGE_AUTOEDIT=no git pull
	# compile qooxdoo site
	./generate.py build
fi
git show HEAD | head -n 1 | sed "s/commit/sdk_js/g" >> ${BUILDS_VER_PATH}

# Generating HW #
if [[ $PARTS == *hw* ]]; then
	# fetch updates from git
	cd "${WDIR}/hw"
	echo -e "Processing <${green}HW${NC}> ..."
	GIT_MERGE_AUTOEDIT=no git pull
fi
git show HEAD | head -n 1 | sed "s/commit/hw/g" >> ${BUILDS_VER_PATH}

# Generating i18n #
if [[ $PARTS == *wialon_i18n* ]]; then
	# fetch updates from git
	cd "${WDIR}/wialon_i18n"
	echo -e "Processing <${green}i18n${NC}> ..."
	GIT_MERGE_AUTOEDIT=no git pull
fi
git show HEAD | head -n 1 | sed "s/commit/wialon_i18n/g" >> ${BUILDS_VER_PATH}

# Generating Wialon Mobile v2 #
if [[ $PARTS == *wialon_mobile2* ]]; then
	# fetch updates from git
	cd "${WDIR}/wialon_mobile2"
	echo -e "Processing <${green}Wialon Mobile v2${NC}> ..."
	GIT_MERGE_AUTOEDIT=no git pull
	# compile qooxdoo site
	./generate.py build
fi
git show HEAD | head -n 1 | sed "s/commit/wialon_mobile2/g" >> ${BUILDS_VER_PATH}

# Generating CMS #
if [[ $PARTS == *cms* ]]; then
	# fetch updates from git
	cd "${WDIR}/cms"
	echo -e "Processing <${green}CMS${NC}> ..."
	# fetch NOT master branch
	GIT_MERGE_AUTOEDIT=no git pull -s recursive -X theirs origin local1804
fi
git show HEAD | head -n 1 | sed "s/commit/cms/g" >> ${BUILDS_VER_PATH}

# Generating fonts #
if [[ $PARTS == *fonts* ]]; then
	# fetch updates from git
	cd "${WDIR}/fonts"
	echo -e "Processing <${green}fonts${NC}> ..."
	GIT_MERGE_AUTOEDIT=no git pull
fi
git show HEAD | head -n 1 | sed "s/commit/fonts/g" >> ${BUILDS_VER_PATH}

# Generating skins #
if [[ $PARTS == *local_skins* ]]; then
	# fetch updates from git
	cd "${WDIR}/local_skins"
	echo -e "Processing <${green}skins${NC}> ..."
	GIT_MERGE_AUTOEDIT=no git pull
fi
git show HEAD | head -n 1 | sed "s/commit/local_skins/g" >> ${BUILDS_VER_PATH}

# Generating logistics #
if [[ $PARTS == *logistics* ]]; then
        # fetch updates from git
        cd "${WDIR}/logistics"
        echo -e "Processing <${green}logistics${NC}> ..."
#        GIT_MERGE_AUTOEDIT=no git pull
	ssh compile@v30.sig "/home/compile/build/logistics/build.sh" > /dev/null 2>&1
        rsync -aSzq --delete compile@v30.sig:/home/compile/build/logistics/src/* ${WDIR}/logistics > /dev/null 2>&1
#        rsync -aSzq --delete compile@v30.sig:/home/compile/build/logistics/logistics.tgz ${WDIR}/logistics > /dev/null 2>&1
fi
#git show HEAD | head -n 1 | sed "s/commit/logistics/g" >> ${BUILDS_VER_PATH}
       LV_HASH=$(ssh compile@v30.sig "cat /home/compile/build/logistics/version.txt")
	echo "logistics ${LV_HASH}" >> ${BUILDS_VER_PATH}

echo "Copying files ..."

MODULES=`find ${WDIR}/modules -mindepth 1 -maxdepth 1 -type d`
for module in ${MODULES}; do
	MODULE=`basename ${module}`
	echo -e "Copying module: ${green} ${MODULE} ${NC}..."
	if [ -f ${WDIR}/modules/${MODULE}/${FILES_LIST} ]; then
		if [ "$PARTS" != "hw" ] || [ "$MODULE" == "hw" ]; then
			echo " - Cleaning $MODULE before copying..."
			rm -rf ${BDIR}/${MODULE}/*
		fi
		cat ${WDIR}/modules/${MODULE}/${FILES_LIST} | while read cfile; do
			FILE_PARAMS=( ${cfile} )
			if [ ${#FILE_PARAMS[@]} == 2 ]; then
				echo " -- file: ${FILE_PARAMS[0]} to ${FILE_PARAMS[1]}"
				DEST_DIR="${BDIR}/${MODULE}/${FILE_PARAMS[1]}/"
				mkdir -p ${DEST_DIR}
				rsync $rsync_options ${WDIR}/${FILE_PARAMS[0]} ${DEST_DIR} > /dev/null 2>&1
			fi
		done

		if [ -f "${WDIR}/modules/${MODULE}/${SUBMODULE_FILE}" ]; then
			SUBNAME=`head -n 1 ${WDIR}/modules/${MODULE}/${SUBMODULE_FILE}`
			if [ -z ${SUBNAME} ]; then
				SUBNAME="$MODULE"
			fi
			SUBMODULES=`find "${BDIR}/${MODULE}" -mindepth 1 -maxdepth 1 -type d`
			for submodule in ${SUBMODULES}; do
				CD=`pwd`
				cd "${submodule}"
				SUBMODULE=`basename ${submodule}`
				rm -rf "../tmp"
				mkdir -p "../tmp/${SUBNAME}"
				mv ${submodule}/* "../tmp/${SUBNAME}/"
				mv ../tmp/* .
				# spike for skins
				find . -type f -name '*' -exec md5sum -b {} + | sort | md5sum -b | awk '{print $1}' > "../${SUBMODULE}.txt"
				echo -e " --- ${green}gziping${NC} submodule < ${SUBMODULE} >..."
				tar -czf "../${SUBMODULE}.tgz" *
				rm -rf "${submodule}"
				rm -rf "../tmp"
				cd "${CD}"
			done;
		fi

		if [ -f "${WDIR}/modules/${MODULE}/${GZIPIT_FILE}" ] && [ ! -z "$(cat ${WDIR}/modules/${MODULE}/${GZIPIT_FILE})" ]; then
			echo -e " --- ${green}gziping${NC} ..."
			cd "${BDIR}/${MODULE}/"
			# calc module version before gzipping
			#find . -type f -name '*' -exec md5sum -b {} + | grep -v 'version.txt' | sort | md5sum -b | awk '{print $1}' > version.txt
			#cat ${BUILDS_VER_PATH}|grep ${MODULE}|awk '{print $2}' > version.txt
			if  [ ${MODULE} == "dep" ]; 
				then find . -type f -name '*' -exec md5sum -b {} + | grep -v 'version.txt' | sort | md5sum -b | awk '{print $1}' > version.txt;
				else cat ${BUILDS_VER_PATH}|grep ${MODULE}|awk '{print $2}' > version.txt;
			fi
			cat "${WDIR}/modules/${MODULE}/${GZIPIT_FILE}" | xargs tar -czf "${MODULE}.tgz"
			cat "${WDIR}/modules/${MODULE}/${GZIPIT_FILE}" | xargs rm -rf
		fi
		echo " - Done"
	else
		echo -e "${red} - Warning! Files list ${MODULE} not found.${NC}"
	fi
done

# merge versions module
if [ -d ${BDIR}/${BUILDS_VER_MODULE} ]; then
	if [ -d ${BDIR}/versions ]; then
		echo -e "${green} Merging versions module ${NC}"
		mv ${BDIR}/${BUILDS_VER_MODULE}/* ${BDIR}/versions
		rm -r ${BDIR}/${BUILDS_VER_MODULE}
	fi
fi

# touch "$BDIR/update.me"

# sync adf folder into vlan
echo "Syncing into vlan ..."
cd ${WDIR}
mkdir -p $install_root/wdc/local1804
rsync $rsync_options tree/* $install_root/wdc/local1804/

# install to license
#echo "Installing to license ..."
#~/build/install.sh license.sig wdc/local1804

#echo "Updating license ..."
#~/build/scripts/helpers/service_shell.sh license "./update.sh"
echo "Done"
echo "To install Wialon Local run install and update scripts"

log_action "building wdc/local done, BRANCH=$BRANCH, PARTS=$PARTS"

