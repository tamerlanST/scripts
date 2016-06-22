#!/bin/bash
ENDPOINT= 'http://sales.gurtam.net/SALES/ws/rp?wsdl'
ACTION = 'DistroAccInfo'
JSON='str={"client":"gurtam","client_info":"1","discount_info":"1","offices_info":"1","service_list":["W3H","W3","WL","WLL"],"service_info":"gurtam","modules_info":"gurtam","payments_info":"gurtam"}'





#resp=`curl --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:urn:GetVehicleLimitedInfo" --data @request.xml http://11.22.33.231:9080/VehicleInfoQueryService.asmx`

resp=`curl --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:$ACTION" --data "$JSON" $ENDPOINT`

#resp=`curl -sX POST -H "Content-Type: application/json" "$server" --data "$jameson"`


$ curl -X POST -H "Content-Type: text/xml" \
    -H "SOAPAction: \"http://api.eyeblaster.com/IAuthenticationService/ClientLogin\"" \
    --data-binary @request.xml \
    https://sandbox.mediamind.com/Eyeblaster.MediaMind.API/V2/AuthenticationService.svc