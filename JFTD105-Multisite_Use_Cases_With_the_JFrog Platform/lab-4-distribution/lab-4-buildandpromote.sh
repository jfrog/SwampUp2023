cd ./example/maven-example
# config Maven
jf c use swampup

jf mvnc --server-id-resolve swampup --server-id-deploy swampup --repo-resolve-releases clear --repo-resolve-snapshots payment-maven-dev-virtual --repo-deploy-releases payment-maven-dev-virtual --repo-deploy-snapshots payment-maven-dev-virtual

# Build Maven Project
jf mvn clean install -f pom.xml --build-name payment-maven --build-number 2.0.0

#Collect environment variables.
jf rt build-collect-env payment-maven 2.0.0
#Collect VCS details from git and add them to a build.
jf rt build-add-git payment-maven 2.0.0
#Publish build info.
jf rt build-publish payment-maven 2.0.0
# promote build in Artifactory.
jf rt build-promote payment-maven 2.0.0 payment-maven-qa-local --status='QA candidate' --comment='webservice is now QA candidate and hand over for regression test' --copy=true --props="maintainer=SolEng;stage=qa"
# set properties
jf rt sp "payment-maven-qa-local/org/jfrog/test/" "unit.test=pass;"
