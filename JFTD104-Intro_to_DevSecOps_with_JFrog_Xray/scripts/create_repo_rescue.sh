#!/usr/bin/env sh

# setting PWD
cd ..

sh create_local_repos.sh
sh create_remote_repos.sh
sh create_virtual_repos.sh

RANDOM=$$
export BUILD_NUMBER=${RANDOM}

echo "Publish Dummy Build to Artifactory"
jf rt bp --build-url JFrog-CLI swampup23_jftd104_mvn_pipeline $BUILD_NUMBER
jf rt bp --build-url JFrog-CLI swampup23_jftd104_npm_pipeline $BUILD_NUMBER

