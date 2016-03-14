#!/bin/bash

import urllib
import urllib2
import re
import time
from bs4 import BeautifulSoup

content = urllib2.urlopen("http://hosting.wialon.com/login.html").read()
soup = BeautifulSoup(content, 'lxml')

signKey = ""

for input in soup.find_all('input'):
    if input.get('name') == 'sign':
      signKey =  input.get('value')
      break

url = "http://hosting.wialon.com/oauth.html"
values = {"client_id": "Wialon Hosting", "redirect_uri":"http://hosting.wialon.com/login.html", "access_type":"0x100", "activation_time":"0", "duration":"2592000", "flags":"6", "login":"", "passw":"", "sign": signKey}

print values

time.sleep(1)

data = urllib.urlencode(values)
req = urllib2.Request(url, data)

response = urllib2.urlopen(req)
#he_page = response.read()
redirect_url = response.geturl()
#print the_page

print "REDIRECT_URL: " + redirect_url

pattern = re.compile(".*" + "access_token=([0-9a-fA-F]{72})" + "\&" + "svc_error=(\\d)" + ".*")
parser = pattern.match(redirect_url)
token = parser.group(1)
svc_error = parser.group(2)

print "TOKEN: " + token
print "SVC_ERROR: " + svc_error