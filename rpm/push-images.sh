#!/bin/bash
set -ex
tags="centos5 centos6 centos7"

if [ -z "${DOCKER_REGISTRY_HOST}" ]; then
  echo "Please define the DOCKER_REGISTRY_HOST environment variable before running this script."
  exit 1
fi

for t in ${tags}; do
  STATE=$(echo ${BUILD_PLATFORM} | grep ${t} | awk '{print $1}')
  if [ ! -z "$STATE" ]
  then
    docker tag -f  italiangrid/pkg.storm-webdav-server:${t} ${DOCKER_REGISTRY_HOST}/italiangrid/pkg.storm-webdav:${t}
    docker push ${DOCKER_REGISTRY_HOST}/italiangrid/pkg.storm-webdav:${t}
  fi
done
