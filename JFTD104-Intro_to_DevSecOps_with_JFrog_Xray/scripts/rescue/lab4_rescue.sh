#!/usr/bin/env sh

export ARTIFACTORY_HOSTNAME="sup23sjom103"
export ARTIFACTORY_USER="swampup@jfrog.com"
export ARTIFACTORY_PASS="SwampUp2023!"

docker login -u ${ARTIFACTORY_USER} -p ${ARTIFACTORY_PASS} ${ARTIFACTORY_HOSTNAME}.jfrog.io
docker tag demosecurity.jfrog.io/containers/ics:latest2 ${ARTIFACTORY_HOSTNAME}.jfrog.io/containers/ics:latest2
docker push ${ARTIFACTORY_HOSTNAME}.jfrog.io/containers/ics:latest2