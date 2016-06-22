<?php
 $client = new SoapClient('http://sales.gurtam.net/SALES/ws/rp?wsdl', [
    'login' => 'wdc',
    'password' => 'DF8vScVjZxYcJmxDb',
]);

$param = '{"client":"gurtam","client_info":"1","discount_info":"0","offices_info":"1","service_list":["W3H","W3","WL","WLL"],"service_info":"gurtam","modules_info":"gurtam","payments_info":"gurtam"}';
/*[
    'client' => 'zibrtest',
    'service_list' => ['W3H','WL','WLL','WLR','W3'],
    'service_info' => 'NULL',
    'modules_info' => 'NULL',
    'payments_info' => 'NULL',
];
*/

$n = 5;
for($i=0; $i<$n; $i++){
    $result = $client->DistroAccInfo(['str' => $param])->return;
    #echo ".";
    echo $result;
}