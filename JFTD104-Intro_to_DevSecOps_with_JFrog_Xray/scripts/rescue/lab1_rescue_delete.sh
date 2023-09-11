#!/usr/bin/env sh

# setting PWD
cd ..

# Delete all the repositories
for row in $(cat ./json/delete-repos.json | jq -r '.[] | @base64'); do
    _jq() {
      echo ${row} | base64 --decode | jq -r ${1}
    }

    jf rt repo-delete --quiet "$(_jq '.key')"
done

echo "START : Delete Builds : "
jf rt curl -XPOST /api/build/delete -H "Content-Type: application/json" -d @json/delete-maven-build.json
jf rt curl -XPOST /api/build/delete -H "Content-Type: application/json" -d @json/delete-npm-build.json
echo "\nComplete : Delete Builds : "

# Index Resources - repositories and builds
jf xr curl -XDELETE /api/v1/binMgr/1/repos -H "Content-Type: application/json" -d @json/index-repos.json
jf xr curl -XDELETE /api/v1/binMgr/1/builds -H "Content-Type: application/json" -d @json/index-builds.json

# Delete Watches
jf xr curl -XDELETE /api/v2/watches/prod-watch -H 'Content-Type: application/json'

# Delete Policies
jf xr curl -XDELETE /api/v2/policies/prod-security-policy -H 'Content-Type: application/json'
jf xr curl -XDELETE /api/v2/policies/prod-license-policy -H 'Content-Type: application/json'
jf xr curl -XDELETE /api/v2/policies/prod-operational-risk-policy -H 'Content-Type: application/json'
