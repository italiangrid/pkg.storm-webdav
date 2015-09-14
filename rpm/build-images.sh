#!/bin/bash
set -ex
tags="centos5 centos6 centos7"

for t in ${tags}; do
  STATE=$(echo ${BUILD_PLATFORM} | grep ${t} | awk '{print $1}')
  if [ ! -z "$STATE" ]
  then
     docker build -t italiangrid/pkg.storm-webdav:${t} -f Dockerfile-${t} .
  fi
done
