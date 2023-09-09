# LAB 4 - Distribution of Artifacts

## Prerequisites
- Lab-0 - Configure JFrog CLI
- Lab-1 - Repository Provisioning

cd ./example/maven-example
# config Maven
- STEP 1 : Run
  ```
  jf c use swampup
  ```

- STEP 2 : Run
  ```
  jf mvnc --server-id-resolve swampup --server-id-deploy swampup --repo-resolve-releases clear --repo-resolve-snapshots payment-maven-dev-virtual --repo-deploy-releases payment-maven-dev-virtual --repo-deploy-snapshots payment-maven-dev-virtual
  ```

# Build Maven Project
- STEP 3 : Run ``jf mvn clean install -f pom.xml --build-name payment-maven --build-number 2.0.0```

#Collect environment variables.
- STEP 4 : Run ``jf rt build-collect-env payment-maven 2.0.0```
#Collect VCS details from git and add them to a build.
- STEP 5 : Run ``jf rt build-add-git payment-maven 2.0.0```
#Publish build info.
- STEP 6 : Run 
```
jf rt build-publish payment-maven 2.0.0
```
# promote build in Artifactory.
- STEP 7 : Run 
  ```
   jf rt build-promote payment-maven 2.0.0 payment-maven-qa-local --status='QA candidate' --comment='webservice is now QA candidate and hand over for regression test' --copy=true --props="maintainer=SolEng;stage=qa"
  ```
# set properties
- STEP 8 : Run 
  ```
   jf rt sp "payment-maven-qa-local/org/jfrog/test/" "unit.test=pass;"
  ```

### CREATE RELEASE BUNDLE
- STEP 9 : Run 
 ```
  jf ds rbc --spec=rb-spec.json rb_swamp 1.0.0 --desc="release candidate"
 ```

### SIGN RELEASE BUNDLE
- STEP 10 : Run 
  ```
  jf ds rbs rb_swamp 1.0.0
  ```

### DISTRIBUTE RELEASE BUNDLE
- STEP 11 : Run 
  ```
   jf ds rbd --dist-rules=dist-rules.json rb_swamp 1.0.0
  ```
    - we need to update ``dist-rules.json`` with our own edge. Example `sup23sjoe106`
