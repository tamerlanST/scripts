curl -X PUT --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"reset":true,"sniffer_uri":"192.168.7.133:20255"}' 'http://netproxy-2.sig.gurtam.local:8001/ports/20255,21071'