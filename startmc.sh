#!/bin/sh
#
#

dd if=/dev/zero of=/swapfile bs=1M count=2048
mkswap /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo 'echo "/swapfile  none  swap  defaults  0  0" >> /etc/fstab'

docker-compose up --no-start mcdata
docker-compose up -d mc
(sleep 60;docker-compose logs --tail=30 mc) &
docker ps

