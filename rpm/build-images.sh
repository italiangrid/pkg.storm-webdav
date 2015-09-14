#!/bin/bash
set -ex
plat=$1
tags="centos5 centos6 centos7"

for t in ${tags}; do
  if [ "${plat}" == "${t}" ]; then
     docker build -t italiangrid/pkg.storm-webdav:${t} -f Dockerfile-${t} .
  fi
done
