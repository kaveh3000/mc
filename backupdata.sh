#!/bin/sh
#
#

BKPVOL=$(basename `pwd`)_mcdata
BKPSRC=$(docker volume inspect -f '{{ .Mountpoint }}' ${BKPVOL})

docker build -t kaveh8000/mcdata:setup -t kaveh8000/mcdata:setup_`TZ=America/Toronto date +%Y%m%d_%H%M` .
docker build -t kaveh8000/mcdata -t kaveh8000/mcdata:`TZ=America/Toronto date +%Y%m%d_%H%M` \
	${BKPSRC}
docker login -u kaveh8000
docker image ls |awk '/kaveh/ && /seconds/ {print "docker push",$1":"$2}'|sh -x

