jf c use swampup

# Index Resources - repositories and builds
jf xr curl -XPUT /api/v1/binMgr/1/repos -H "Content-Type: application/json" -d @index-repos.json
jf xr curl -XPUT /api/v1/binMgr/1/builds -H "Content-Type: application/json" -d @index-builds.json

# Create Policies
jf xr curl -XPOST /api/v2/policies -H 'Content-Type: application/json' -d @prod-sec-policy.json
jf xr curl -XPOST /api/v2/policies -H 'Content-Type: application/json' -d @prod-lic-policy.json
jf xr curl -XPOST /api/v2/policies -H 'Content-Type: application/json' -d @prod-operational-risk-policy.json

# Create Watch
jf xr curl -XPOST /api/v2/watches -H 'Content-Type: application/json' -d @prod-watch.json