#!/usr/bin/env sh

#################
# init process #
#################

#!/usr/bin/env sh

#################
# init process #
#################
export CLI_INSTANCE_ID=swampup2023

jf config use $CLI_INSTANCE_ID

cd ../../lab-3/project-examples/npm-vulnerable-example

rm -r node_modules
rm package-lock.json

echo "Jfrog is accessible check : "
jf rt ping


#Config Maven

jf npmc --repo-resolve jftd104-npm-virtual --repo-deploy jftd104-npm-virtual

RANDOM=$$
export BUILD_NUMBER=${RANDOM}

#Run NPM Build

jf npm install --build-name=swampup23_jftd104_npm_pipeline --build-number=$BUILD_NUMBER

jf npm publish --build-name=swampup23_jftd104_npm_pipeline --build-number=$BUILD_NUMBER


#Collect Environment Variables

jf rt bce swampup23_jftd104_npm_pipeline $BUILD_NUMBER

#Collect GIT Variables

jf rt bag swampup23_jftd104_npm_pipeline $BUILD_NUMBER

#Publish Build Info

jf rt bp --build-url JFrog-CLI swampup23_jftd104_npm_pipeline $BUILD_NUMBER

echo "START : Xray Scan"
jf bs swampup23_jftd104_npm_pipeline $BUILD_NUMBER
echo "COMPLETE : Xray Scan"
