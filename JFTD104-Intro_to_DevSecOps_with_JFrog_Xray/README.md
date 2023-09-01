# Introduction to DevSecOps with JFrog Xray

## Agenda
- Lab 1 - Indexing Resources and Create Policy
- LAB 2 - Create Watch and check for violation
- LAB 3 - Shift Left Security
- Lab 4 - Exploring JFrog Advanced Security

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
- All content related today's training is under "**SUP003-Intro_to_DevSecOps_with_JFrog_Xray/**".


<br/>

## .env config on the EC2 instance [Must]
- Our directory `SwampUp2023/JFTD104-Intro_to_DevSecOps_with_JFrog_Xray` has `.env` or `env.bat` file where we need define environment variables.
  - Mandatory - JFROG_PLATFORM, ADMIN_USER, ADMIN_PASSWORD, JFROG_EDGE
  - Optional - ACCESS_TOKEN
- For linux machine - `source .env` or for windows - `call env.bat`

<br/>


## Labs

### Fill instructions based on Fabien's base image instructions.