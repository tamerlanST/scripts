wget -nd --keep-session-cookies --cookies=on --save-cookies cook.txt --post-data 'login=stan93_$i&passw=stan' http://hst-api.wialon.com/ 
&& wget -nd --load-cookies cook.txt -p http://hst-api.wialon.com/oauth.html
&& rm -f cook.txt 
&& rm -f index.html 


login=stan93_$i&passw=stan&lang=ru&client_id=Wialon+Hosting&access_type=-1&activation_time=0&duration=2592000&flags=2&redirect_uri=http://stan.test.gurtam.net:8030/checker.html&response_type=hash&wialon_sdk_url=&sign=$sign


/usr/bin/wget -nd --keep-session-cookies --cookies=on --save-cookies /root/cook.txt --post-data 'username=me&password=letmeindamnyou' http://www.mysite.com/ 
&& /usr/bin/wget -nd --load-cookies /root/cook.txt -p http://www.mysite.com/script.php 
&& rm -f /root/cook.txt 
&& rm -f /root/index.html 
&& rm -f /root/script.php