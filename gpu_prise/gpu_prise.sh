#!/bin/bash

resp=`curl -s "https://catalog.api.onliner.by/search/videocard?desktop_gpu\[0\]=radeonrx580&desktop_gpu\[operation\]=union&videoram_videoc\[from\]=3388608&videoram_videoc\[to\]=5388608&order=price:asc" | jq '.products' | jq '.[0]' | jq '.prices.price_min.amount'`
echo "rx580 4gb min price:" $resp "BYN."

resp=`curl -s "https://catalog.api.onliner.by/search/videocard?desktop_gpu\[0\]=radeonrx580&desktop_gpu\[operation\]=union&videoram_videoc\[from\]=8388608&videoram_videoc\[to\]=8388608&order=price:asc" | jq '.products' | jq '.[0]' | jq '.prices.price_min.amount'`
echo "rx580 8gb min price:" $resp "BYN."
