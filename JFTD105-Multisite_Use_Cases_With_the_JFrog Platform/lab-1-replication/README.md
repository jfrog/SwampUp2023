# LAB 3 - Build, Properties and Replication

## Prerequisites
- Lab-0 - Configure JFrog CLI


# Configure Push Replication

## CREATE REPLICATION TEMPLATE
- Run

  ```
  jf rt replication-template template-push.json
  ```

  or

  ```
   jf rt rplt template-push.json
  ```

  - Select replication job type (press Tab for options): `push`
  - Enter source repo key > `jftd105lab1-maven-dev-local`         
  - Enter target repo key > `jftd105lab1-maven-dev-local`   
  - Enter target Server server id > swampupsecond
  - Enter cron expression for frequency (for example, 0 0 12 * * ? will replicate daily) > `*/10 * * * * ?`
  - You can type ":x" at any time to save and exit.
  - Select the next property > `enabled`
  - Insert the value for enabled (press Tab for options): > `true`
  - Select the next property > `enableEventReplication`
  - Insert the value for enableEventReplication (press Tab for options): > `true`
  - Select the next property > `syncDeletes`
  - Insert the value for syncDeletes (press Tab for options): > `true`
  - Select the next property > `syncProperties`
  - Insert the value for syncProperties (press Tab for options): > `true`
  - Select the next property > `syncStatistics`
  - Insert the value for syncStatistics (press Tab for options): > `true`
  - Select the next property > `:x`

- Validate template template-push.json is created successfully. `- ls -la`
- View template

      ```json
      {
        "cronExp": "*/10 * * * * ?",
        "enableEventReplication": "true",
        "enabled": "true",
        "repoKey": "jftd105lab1-maven-dev-local",
-       "serverId":"swampupedge",
-       "targetRepoKey":"jftd105lab1-maven-dev-local"
        "syncDeletes": "true",
        "syncProperties": "true",
        "syncStatistics": "true"
      }
      ```
- Run
  ```
   jf rt replication-create template-push.json
  ```

<br />


# Configure Pull Replication

## CREATE REPLICATION TEMPLATE
- Run

  ```
   jf rt replication-template template-pull.json
  ```

  or

  ```
  jf rt rplt template-pull.json
  ```

  - Select replication job type (press Tab for options): `pull`
  - Enter source repo key > `jftd105lab1-maven-remote`          # Smart Repository (Remote repository pointing other repository from other Artifactory instance)
  - Enter cron expression for frequency (for example, 0 0 12 * * ? will replicate daily) > `*/10 * * * * ?`
  - You can type ":x" at any time to save and exit.
  - Select the next property > `enabled`
  - Insert the value for enabled (press Tab for options): > `true`
  - Select the next property > `enableEventReplication`
  - Insert the value for enableEventReplication (press Tab for options): > `true`
  - Select the next property > `syncDeletes`
  - Insert the value for syncDeletes (press Tab for options): > `true`
  - Select the next property > `syncProperties`
  - Insert the value for syncProperties (press Tab for options): > `true`
  - Select the next property > `syncStatistics`
  - Insert the value for syncStatistics (press Tab for options): > `true`
  - Select the next property > `:x`

- Validate template template-pull.json is created successfully. `- ls -la`
- View template

      ```json
      {
        "cronExp": "*/10 * * * * ?",
        "enableEventReplication": "true",
        "enabled": "true",
        "repoKey": "jftd105lab1-maven-remote",
        "syncDeletes": "true",
        "syncProperties": "true",
        "syncStatistics": "true"
      }
      ```
- Run
- Set to swampupsecond instance
```
jf c use swampupsecond
```
- Apply the pull replication details
  ```
  jf rt replication-create template-pull.json
  ```
- Verify by logging to swampupsecond instance
- Go to Administration Tab-->Repositories-->Repositories-->Remote 
- Select the repository 
- Verify URL pointing to Swampup main JPD and verify replication details in "Replication" tab
<br />


## RUN SCRIPT[Optional]
- Run 
```
sh lab_1_replication_rescue.sh
```


