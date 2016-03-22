#!/bin/bash
ssh root@bile.test './mt_sign.sh' &
ssh root@krir.test './mt_sign.sh' &
ssh root@namo.test './mt_sign.sh' &
ssh root@tata.test './mt_sign.sh' &
ssh root@nevl.dev './mt_sign.sh' &
ssh root@yami.test './mt_sign.sh' &
ssh root@ws000040 './mt_sign.sh' &
ssh root@ilma.test './mt_sign.sh' &
./mt_sign.sh &
ssh nevl@nevl.test './mt_sign.sh' &
ssh root@qa.test 'cpu_load.sh' &
wait
