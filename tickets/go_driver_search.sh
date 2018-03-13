#!/bin/bash
server='https://hst-api.wialon.com/wialon/ajax.html'
svc='core/search_items'
sid='05e9030a5655fb4d7d233fdf0285c3b9'
params='{"spec":{"itemsType":"avl_unit","propName":"rel_hw_type_name","propValueMask":"bce fm ta*","sortType":"sys_name"},"force":1,"flags":1439,"from":0,"to":999}'
resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params" | jq .items | jq .[] | jq .uid `

echo $resp >> ids

