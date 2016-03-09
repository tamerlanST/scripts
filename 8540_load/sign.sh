#!/bin/bash
sign=`curl -s -H "Content-Type:application/x-www-form-urlencoded" "http://stan.test.gurtam.net:8030" | grep -i -o '"sign" value="[^"]*"' | cut -c15-58`
fn=`date +%d%m%y`
echo $sign
#curl --request POST "http://example.com/form/" --data "field1=value1&field2=value2"
#curl -i --request POST "http://stan.test.gurtam.net:8030/oauth.html" --data "login=biguser&passw=&lang=ru&client_id=Wialon+Hosting&access_type=-1&activation_time=0&duration=2592000&flags=2&redirect_uri=http://stan.test.gurtam.net:8030/checker.html&response_type=hash&wialon_sdk_url=&sign=$sign"

resp=`curl -s -H "Content-Type:application/x-www-form-urlencoded" -iX POST "http://stan.test.gurtam.net:8030/oauth.html" --data "login=biguser&passw=&lang=ru&client_id=Wialon+Hosting&access_type=-1&activation_time=0&duration=2592000&flags=2&redirect_uri=http://stan.test.gurtam.net:8030/checker.html&response_type=hash&wialon_sdk_url=&sign=$sign" | grep -i -o 'HTTP/1.0[^"]*'| cut -c10-12`
echo $resp
if [ "$resp" = "301" ];
	then echo "core/logout" >> "$fn.txt"
fi

#<input type="hidden" name="sign" value="jgXdVPX5Tr3M4jl3Sv1Sui89c2nPkN3wXtjvgFe9HW8=">
#"sign" value="lD9jTD5UJs+grYOzNZrMVC89c2nPkN3wXtjvgFe9HW8="
#| grep -i -o '"eid":"[^"]*"'`
#| jq '.["eid"]' | cut -c2-33`
#sid=`curl -s "http://stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/login&params=\{\"user\":\"stan93_$i\",\"password\":\"stan\"\}"| jq '.["eid"]' | cut -c2-33`


#adf_trace
#Pi /TmcPygdMUIyjAj4dUi89c2nPkN3wXtjvgFe9HW8=
#cut
#Pi+/TmcPygdMUIyjAj4dUi89c2nPkN3wXtjvgFe9HW8=
