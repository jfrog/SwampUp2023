# JFTD103 - JFrog Platform Automation 

### Agenda
- Lab 0 - Configure JFrog CLI
- LAB 1 - Repository Provisioning
- LAB 2 - Role-Based Access Control
- LAB 3 - Build Integration and Properties
    - `jf ci-setup` auto generate `yml` or `jenkins` file with CLI Steps
- LAB 4 - Configure Replication
- LAB 5 - Artifactory Query Language
    - Search, Upload, Download, Cleanup, etc
- LAB 6 - Xray
- LAB 7 - Distribution
- LAB 8 - JFROG CLI Plugin


<br/>

## Prerequisites

- Generate a Github personnal [access token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token). <br/>
  - **NOTE**: if you already have GitHub access token then skip this step else create GitHub account first and then follow above steps.
- Confirm `git` [client](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup) has been configured with your user
  - verify with ``git config --list``
- Fork [jfrog/SwampUp2023](https://github.com/jfrog/SwampUp2023) github repository.
  - Reference document to [fork repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository).
- `git clone` the forked repo on your workstation
  - Reference document to [clone repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo#cloning-your-forked-repository).
- Preferred IDE (Integrated Development Environment) like [Intellij](https://www.jetbrains.com/idea/download/?section=mac#section=mac), [VSCode](https://code.visualstudio.com/download)
- All content related today's training is under "**JFTD103-JFrog_Platform_Automation/**".

<br/>

## .env config [Must]
- Our directory `SwampUp2023/JFTD103-JFrog_Platform_Automation` has `.env` or `env.bat` file where we need define environment variables.
  - Mandatory - JFROG_PLATFORM, ADMIN_USER, ADMIN_PASSWORD, JFROG_EDGE
  - Optional - ACCESS_TOKEN
- For linux machine - `source .env` or for windows - `call env.bat`

<br/>


## Run Labs

### Option 1 [Recommended]
- We will provide cloud hosted VM with basic setup like maven, npm, docker, git client install
  - this will ease your setup to run labs
  - NOTE: To ssh into that machine, it is required to have SSH and telnet client like terminal, puTTY, git bash or your preferred client

### Option 2
- We will be using IDE (any with terminal) or terminal/CMD as part of our labs so please download and install one if you do not have one on your workstation.
- Download [JFrog CLI](https://jfrog.com/getcli/) based on our machine.
- Setup MAVEN or NPM and Docker Client.
  - so we can run commands like `mvn install`, `npm install` or `docker pull image:tag`
