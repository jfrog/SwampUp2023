
for row in $(cat ./delete-repos.json | jq -r '.[] | @base64'); do
    _jq() {
      echo ${row} | base64 --decode | jq -r ${1}
    }
    jf c use swampup
    jf rt repo-delete "$(_jq '.key')" --quiet
    jf c use swampupedge
    jf rt repo-delete "$(_jq '.key')" --quiet
    jf c use swampupsecond
    jf rt repo-delete "$(_jq '.key')" --quiet

done
jf c use swampup

