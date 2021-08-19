#!/bin/bash

cd ..

cp  daily-circular-dev/docker-compose.yml .

echo '------------------------------'
echo 'cloning project repos ....'
echo '------------------------------'

git clone git@github.com:Work-Station-101/daily-circular-client.git

echo '------------------------------'
echo 'cloning complete !!!'
echo '------------------------------'
echo 'start docker containers ...'
echo '------------------------------'

docker-compose up -d --build
