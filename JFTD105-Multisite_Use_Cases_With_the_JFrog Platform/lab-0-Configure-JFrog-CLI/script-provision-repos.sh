# set to swampup
jf c use swampup
# creating repos on swampup
sh create_local_repos.sh
sh create_remote_repos.sh

# set to swampup second
jf c use swampupsecond
# creating repos on swampup second
sh create_local_repos.sh
sh create_remote_repos.sh

# switch to swampupedge
jf c use swampupedge
# creating repos on edge nodes
sh create_local_repos.sh

# switch back to MAIN JPD
jf c use swampup