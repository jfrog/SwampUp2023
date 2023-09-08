#!/usr/bin/env sh

#################
# init process #
#################

#!/usr/bin/env sh

#################
# init process #
#################

#echo "Configuration name for CLI (unique name) : "
#read -r CLIConfigName

export CLI_INSTANCE_ID=swampup2023

jf config use $CLI_INSTANCE_ID

cd ../lab-3/project-examples/maven-vulnerable-example

echo "Jfrog is accessible check : "
jf rt ping

#Config Maven

jf mvnc --repo-resolve-snapshots jftd104-libs-snapshot-virtual --repo-resolve-releases jftd104-libs-release-virtual --repo-deploy-snapshots jftd104-libs-snapshot-virtual --repo-deploy-releases jftd104-libs-release-virtual

RANDOM=$$
export BUILD_NUMBER=${RANDOM}

#Run Maven Build

jf mvn clean install -Dmaven.test.skip=true -Dartifactory.publish.artifacts=true --build-name=swampup23_jftd104_mvn_pipeline --build-number=$BUILD_NUMBER

#Collect Environment Variables

jf rt bce swampup23_jftd104_mvn_pipeline $BUILD_NUMBER

#Collect GIT Variables

#jf rt bag swampup23_jftd104_mvn_pipeline $BUILD_NUMBER ../../.

#Publish Build Info

jf rt bp --build-url JFrog-CLI swampup23_jftd104_mvn_pipeline $BUILD_NUMBER

echo "START : Xray Scan"
jf bs swampup23_jftd104_mvn_pipeline $BUILD_NUMBER
echo "COMPLETE : Xray Scan"
