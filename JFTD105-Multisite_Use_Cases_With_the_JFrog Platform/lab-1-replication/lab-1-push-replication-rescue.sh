
# create the repo in swampup and swampupsecond
for row in $(cat ./repos-for-push.json | jq -r '.[] | @base64'); do
    _jq() {
      echo ${row} | base64 --decode | jq -r ${1}
    }
    # set the target server to swampupsecond
      jf c use swampupsecond
      jf rt repo-create template-push-rescue.json --vars "repo-name=$(_jq '.key');package-type=$(_jq '.packageType');repo-type=$(_jq '.rclass');repo-layout=$(_jq '.repoLayoutRef');project-key=$(_jq '.projectKey');env=$(_jq '.environments');xray-enable=$(_jq '.xrayIndex')"

    #set the source server to swampup
    jf c use swampup
    jf rt repo-create template-push-rescue.json --vars "repo-name=$(_jq '.key');package-type=$(_jq '.packageType');repo-type=$(_jq '.rclass');repo-layout=$(_jq '.repoLayoutRef');project-key=$(_jq '.projectKey');env=$(_jq '.environments');xray-enable=$(_jq '.xrayIndex')"
    # set the replication configuration
    jf rt replication-create template-push-configuration.json --vars "repo-name=$(_jq '.key')";
done

