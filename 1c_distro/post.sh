#!/bin/bash
fn=`date +%d%m%y`
server='http://api.distro.distro.test.gurtam.net/notification/default/add-notes?verifi=ejfy74nx82kx02kd'
jameson='{"data":[{"ids":["zibrtest"],"title":"TEST","type":"default","message":"message notification"},{"ids":["zibrtest"],"title":"TEST2","type":"default","message":"message notification2"}]}'
         

#resp=`curl -sX POST -H "Content-Type: application/json" -d '$jameson' "$server"`
resp=`curl -sX POST -H "Content-Type: application/json" "$server" --data "$jameson"`
echo $resp

#"data":[
#	{"ids":[
#		"dmittest",
#		"zibrtest"],
#	"title":"TEST",
#	"type":"default",
#	"message":"message notification"},
#
#	{"ids":[
#	"dmittest",
#	"zibrtest"],
#	"title":"TEST2",
#	"type":"default",
#	"message":"message notification2"}
#]





