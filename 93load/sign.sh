#!/bin/bash
n1=$1
n2=$2
n3=$3 #multi treading

time=$(date +%s)
server='qa.test:8019'
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
	post_data="client_id=${client_id}&redirect_uri=http://${server}/login_simple.html&access_type=-1&activation_time=0&duration=2592000&flags=0x7&sign=${REPLY}&login=stan93_1&passw=stan"
	sleep 1
#passed login
  for (( i=$n1; i<$n2; i++ ))
  do
  #echo $i
	 post_data="client_id=${client_id}&redirect_uri=http://${server}/login_simple.html&access_type=-1&activation_time=0&duration=2592000&flags=0x7&sign=${REPLY}&login=stan93_$i&passw=stan"
	 resp=`curl -s -iX POST "http://${server}/oauth.html" --data "$post_data" | grep -i -o 'http://[^"]*response'`
	 token=`curl -s -i "$resp" | grep -i -o 'access_token=[^"]*&user_name' | cut -c14-85`
  #	echo "token$i="$token
	 #if [ "$token" = "" ];
	 #  then echo "$i" >> "$fn"token_error".txt"
	 #fi
  done;

# failed login
  for (( i=$n1; i<$n2; i++ ))
  do
  #echo $i
    post_data="client_id=${client_id}&redirect_uri=http://${server}/login_simple.html&access_type=-1&activation_time=0&duration=2592000&flags=0x7&sign=${REPLY}&login=stan93_$i&passw=fail"
    resp=`curl -s -iX POST "http://${server}/oauth.html" --data "$post_data" | grep -i -o 'http://[^"]*response'`
    token=`curl -s -i "$resp" | grep -i -o 'access_token=[^"]*&user_name' | cut -c14-85`
    #echo "token$i="$token
    #if [ "$token" = "" ];
    #  then echo "$i" >> "$fn"token_error".txt"
    #fi
  done;

echo "$n3 stan.test Выполнено за "$(($(date +%s)-$time))" с."
