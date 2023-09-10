# LAB 0 - Configure JFrog CLI

### Prerequisites
- JFrog CLI is installed on your machine by running `jf -v`
    - if not installed then Download [JFrog CLI](https://jfrog.com/getcli/) based on our machine.

<br/>


- Checkout all ``jf`` configs 
```
  jf config show
```
- The command will return the list of configured JPD platforms. There is a key called "Default".
  If the value is true, that is the JPD is currently connected to. Goto # Step Validation

- If the command returns no result, follow the below steps to configure different domains

## Option 1 - SETUP JFROG CLI WITH MAIN JPD


- ## Step Configuration  
    - Configure CLI that point to JFrog Instance ``jf config add --interactive`` or ``jf c add --interactive``
    - Choose a server ID: ```${{unique name}}```        # like -> `swampup`
    - JFrog platform URL: ```https://{{host}}.jfrog.io```     # JFrog Cloud instance URL from document
    - JFrog access token (Leave blank for username and password/API key): ```${{access_token}}```
        - Create access token from UI ``Administration`` -> ``Identity and Access`` -> ``Access Tokens``
    - Is the Artifactory reverse proxy configured to accept a client certificate (y/n) [n]?: ``n``

    - Repeat the above steps for swampupedge and swampup second JPD platform

- ## Step Validation

    - Use newly created config 
       ```
       jf config use swampup
      ```

    - Healthcheck 
      ```
      jf rt ping
    - ```


![lab0_cli_config](https://user-images.githubusercontent.com/7561138/164789237-bcfd7067-19f6-491f-aae5-e903ad691714.gif)

## Option 2 - SETUP JFROG CLI WITH MAIN JPD without ``--interactive``
```
jf config add swampup --artifactory-url=https://$JFROG_PLATFORM/artifactory --user=$ADMIN_USER --password=$ADMIN_PASSWORD --interactive=false
```


## SETUP JFROG CLI WITH MAIN EDGE NODE
- 
```
jf config add swampupedge --artifactory-url=https://$JFROG_EDGE/artifactory --user=$ADMIN_USER --password=$ADMIN_PASSWORD --interactive=false
```


## SETUP JFROG CLI WITH SECOND JPD without ``--interactive``
```
jf config add swampupsecond --artifactory-url=https://$JFROG_SECOND_PLATFORM/artifactory --user=$ADMIN_USER --password=$ADMIN_PASSWORD --interactive=false
```

## RUN SCRIPT - Prerequisites for future labs that CREATES REPOSITORIES
- Run 
```
sh script-provision-repos.sh
```
  It will create all repositories

<br />
