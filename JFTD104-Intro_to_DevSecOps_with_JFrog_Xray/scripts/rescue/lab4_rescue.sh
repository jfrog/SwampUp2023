#!/usr/bin/env sh

export ARTIFACTORY_HOSTNAME="my-instance"
export ARTIFACTORY_USER="username"
export ARTIFACTORY_PASS="password"

docker login -u ${ARTIFACTORY_USER} -p ${ARTIFACTORY_PASS} ${ARTIFACTORY_HOSTNAME}.jfrog.io
docker tag demosecurity.jfrog.io/containers/ics:latest2 ${ARTIFACTORY_HOSTNAME}.jfrog.io/containers/ics:latest2
docker push ${ARTIFACTORY_HOSTNAME}.jfrog.io/containers/ics:latest2