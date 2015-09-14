#!/bin/bash
set -ex
plat=$1
tags="centos5 centos6 centos7"

if [ -z "${DOCKER_REGISTRY_HOST}" ]; then
  echo "Please define the DOCKER_REGISTRY_HOST environment variable before running this script."
  exit 1
fi

for t in ${tags}; do
  if [ "${plat}" == "${t}" ]; then
    docker tag -f  italiangrid/pkg.storm-webdav-server:${t} ${DOCKER_REGISTRY_HOST}/italiangrid/pkg.storm-webdav:${t}
    docker push ${DOCKER_REGISTRY_HOST}/italiangrid/pkg.storm-webdav:${t}
  fi
done