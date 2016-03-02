webmain1: qa.test:15019
api1_1: qa.test:13019
api2_2: qa.test:17019
Новая система: qa.test без порта.
8540.sh для многопоточности

1) Создать пользователей: create_users.sh
api2: stan_$i (под пользователем stan)
api1: stanbu_$i (под пользователем biguser)
2) Логины core_login.sh (многопоточно 8540.sh)

! в файле core/login.sh попарно запросы для каждого из пунктов описанных ниже
если раскомментировать длинный запрос с переменной и цикл записи в файл - сиды сохранятся в файл построчно, если короткий - просто будет замеряно время выполнения, в секундах.
Через "/" время для нескольких попыток.

Результаты измерений:
Кейсы:
#)url 			|with report	|/dev/null
with port
1)qa.test:13019 |200			|176?162

2)qa.test:15019:
2.1)api1_1		|198			|160
2.2)api2_2		|199			|159

3)qa.test:17019	|198			|161/161/159/159
no port
4)http://stan.test.gurtam.net:8030/?wialon_sdk_url=http://qa.test 
4.1)biguser 	|193			|158
4.2)stan 		|207			|157/161

5.1)qa.test		|200			|156/152/160/151/153/155	//stanbu

5.2)qa.test		|183			|159/148/153/149			//stan
6)qa.test		|280			|247/246/245/247			//stan+stanbu(10к (5 первого и 5 второго)запросов поочередно используя пользователей первого и второго кластера через 1 )
6_2) 147		|187/184		|152/154/149/151/153
6_1)
6) 149
По итогу, с новой системой - запросы отрабатывают быстрее на ~5-7%.
Если обращаться поочередно пользователями 1го и 2го кластера, запросы отрабатывают примерно в 1,5 раза дольше.





ARCGIS_DEFAULT = on
ARCGIS_MAPNAMES = Кадастр
ARCGIS_MAPSERVERS = http://maps.rosreestr.ru/arcgis/rest/services/Cadastre/Cadastre/MapServer/export
GEOSERVER_BASELAYERS_ = 1;1;1;1
GEOSERVER_DEFAULT_ = on
GEOSERVER_MAPNAMES_ = geo1;geo2;geo3;geo4
GEOSERVER_MAPSERVERS_ = http://91.203.10.10:8080/geoserver/gwc/service/gmaps?zoom={2}&x={0}&y={1}&layers=nvr;http://91.203.10.10:8080/geoserver/gwc/service/gmaps?zoom={2}&x={0}&y={1}&layers=mapinfo;http://91.203.10.10:8080/geoserver/gwc/service/gmaps?zoom={2}&x={0}&y={1}&layers=tnk;http://91.203.10.10:8080/geoserver/gwc/service/gmaps?zoom={2}&x={0}&y={1}&layers=sn
appstore_buttons = on
bg_img_count = 5
google_keys_temp = ABQIAAAAdZ82dywN-TyRgs3DfMmmmRRyWf7EsJ-PyKiF0CZYc9SkFmKE_RQDA-QkngWGw57OTLY1qmuYSsfrWA
help_url = http://docs.gurtam.com/ru/hosting/start
languages = en:English;ru:Русский;de:Deutsch;fr:Français;es:Español;pt:Português;it:Italiano;gr:Ελληνικά;nl:Nederlands;bg:Български;hu:magyar;ro:română;sk:slovenčina;pl:Polski;hr:Hrvatski;si:Slovenščina;mk:Македонски;ua:Українська;ee:Eesti keel;lv:Latviešu;fi:suomi;il:עברית;cn:中文;ar:عربي;az:Azərbaycanca;am:Հայերեն;mn:Mongɣol kele;al:Shqip;ge:ქართული;ir:فارسی;id:Bahasa Indonesia;rs:Српски;ku:Kurdî;
luxena_default = 1
navteq_keys_temp = FJXd10911293a6b04296707043b6abc4X50
support_url = https://support.gurtam.com/support
title = Wialon Hosting
virtual_earth_default = 1
visicom_keys = 62a3e1b84bf1c2e66820a5936ea12785
wialon_sdk_url = https://hst-api.wialon.com
wikimapia_default = 1
yandex_keys = wialonb3.gurtam.com AHKNM0kBAAAA2ftOPAMAz76G-TKEiT_3VUx1EMe2xIWFWgwAAAAAAAAAAACnZVmNQZM22V41upp1Z7KZGBrbeQ==
