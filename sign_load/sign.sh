#!/bin/bash
n1=$1
n2=$2
n3=$3 #multi treading

time=$(date +%s)
#server='qa.test.gurtam.net'
server='cms.stan.test.gurtam.net:8030'
client_id='Wialon Hosting'
fn=`date +%d%m%y`

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
	sign=`curl -s "${server}/login_simple.html" | grep -i -o '"sign" value="[^"]*"' | cut -c15-58`
	urlencode $sign >>/dev/null
	post_data="client_id=${client_id}&redirect_uri=http://${server}/login_simple.html&access_type=-1&activation_time=0&duration=2592000&flags=0x7&sign=${REPLY}&login=stan&passw=stan"
	sleep 1
  #echo $sign
	 resp=`curl -s -iX POST "http://${server}/oauth.html" --data "$post_data" | grep -i -o 'http://[^"]*response'`
	 token=`curl -s -i "$resp" | grep -i -o 'access_token=[^"]*&user_name' | cut -c14-85`
   echo "token="$token
	 

echo "$n3 stan.test Выполнено за "$(($(date +%s)-$time))" с."
