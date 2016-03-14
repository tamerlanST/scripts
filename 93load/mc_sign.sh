#!/bin/bash
./mt_sign.sh &
ssh root@qa.test './mt_sign.sh' &
wait
