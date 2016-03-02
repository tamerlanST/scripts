#!/bin/bash
URL="http://blog.gurtam.com/wp-content/uploads/2011/06/Яхта.jpg" ; 
URL=$(perl -MURI::Escape -e 'print uri_escape shift, , q{^A-Za-z0-9\-._~/:}' -- "$URL")
curl -Is "Accept-Encoding:gzip" $URL	