#!/bin/bash
server='seal.dev:8004'
login='test1'
passw='1'
client_id='Wialon Hosting'

urlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER) 
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

SIGN=$(wget -q -O- -nd --keep-session-cookies --cookies=on --save-cookies cook.txt http://seal.dev:8004/login_simple.html | grep 'name=\"sign\"\svalue=\"[0-9A-Za-z\/=+]*\"' | sed -e 's/[<A-Za-z\" =]*value\="//' | sed 's/\">//g'| sed 's/\t//g')

urlencode $SIGN

post_data="client_id=${client_id}&redirect_uri=http://${server}/login_simple.html&access_type=-1&activation_time=0&duration=2592000&flags=0x7&sign=${REPLY}&login=${login}&passw=${passw}"

sleep 1
$(wget --cookies=on --keep-session-cookies --load-cookies=cook.txt --post-data="${post_data}" http://${server}/oauth.html)
token=$(cat oauth.html | grep 'var token = \"[0-9A-Za-z\/=+]*\"' | sed 's/var token = \"//g' | sed 's/\t//g')

echo "Login token:${token:0:72}"

$(rm oauth.html*)
