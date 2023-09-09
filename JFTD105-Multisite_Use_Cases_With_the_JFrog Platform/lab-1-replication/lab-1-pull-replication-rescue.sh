
# create the repo in swampup
for row in $(cat ./repos-for-pull.json | jq -r '.[] | @base64'); do
    _jq() {
      echo ${row} | base64 --decode | jq -r ${1}
    }
    # set the source server to swampup
      jf c use swampup
      jf rt repo-create template-pull-rescue.json --vars "repo-name=$(_jq '.sourcekey');package-type=$(_jq '.packageType');repo-type=$(_jq '.sourcerclass');repo-layout=$(_jq '.repoLayoutRef');project-key=$(_jq '.projectKey');env=$(_jq '.environments');xray-enable=$(_jq '.xrayIndex')"

    #set the target server to swampupsecond
    jf c use swampupsecond
    jf rt repo-create template-pull-rescue.json --vars "repo-name=$(_jq '.targetkey');source-repo-name=$(_jq '.sourcekey');package-type=$(_jq '.packageType');repo-type=$(_jq '.targetrclass');repo-layout=$(_jq '.repoLayoutRef');project-key=$(_jq '.projectKey');env=$(_jq '.environments');xray-enable=$(_jq '.xrayIndex')"
    # set the replication configuration
    jf rt replication-create template-pull-configuration.json --vars "source-repo-name=$(_jq '.sourcekey');target-repo-name=$(_jq '.targetkey')"
done

