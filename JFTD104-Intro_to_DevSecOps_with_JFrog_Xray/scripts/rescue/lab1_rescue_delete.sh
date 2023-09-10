jf c use swampup2023

# Create all the repositories
sh delete_repo_rescue.sh

# Index Resources - repositories and builds
jf xr curl -XDELETE /api/v1/binMgr/1/repos -H "Content-Type: application/json" -d @../json/index-repos.json
jf xr curl -XDELETE /api/v1/binMgr/1/builds -H "Content-Type: application/json" -d @../json/index-builds.json

# Delete Watches
jf xr curl -XDELETE /api/v2/watches/prod-watch -H 'Content-Type: application/json'

# Delete Policies
jf xr curl -XDELETE /api/v2/policies/prod-security-policy -H 'Content-Type: application/json'
jf xr curl -XDELETE /api/v2/policies/prod-license-policy -H 'Content-Type: application/json'
jf xr curl -XDELETE /api/v2/policies/prod-operational-risk-policy -H 'Content-Type: application/json'
