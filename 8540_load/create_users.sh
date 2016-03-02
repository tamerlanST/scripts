#!/bin/bash

time=$(date +%s)
for i in {3297..9999}; do {
curl -s "http://cms.stan.test.gurtam.net:8030/wialon/ajax.html?svc=core/create_user&params=\{\"creatorId\":68970,\"name\":\"stanbu_$i\",\"password\":\"stan_$i\",\"dataFlags\":1\}&sid=44f20a4e697516c86a1075028b12bde0"
echo "Create user stanbu_"$i
}
done;
echo "Выполнено за "$(($(date +%s)-$time))" с."