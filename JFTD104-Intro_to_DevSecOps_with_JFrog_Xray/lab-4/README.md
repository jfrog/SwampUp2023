# Lab4 - Advanced Security
- Prerequisites
- Advanced Security

## Prerequisites
- A SAAS Instance of JFrog Platform. This will be provided as part of your enrollment to the Training class.
- JFrog CLI is installed on your machine by running `jf -v`

<br/>

## Explore
- Navigate to `XRay -> Scans List -> containers2 -> ics/latest -> Vulnerabilities`.
- Look at “CVE-2020-9546”
  - Is it applicable to this docker image?
  - What is the risk?
  - What is the remediation process?
- Now look at “CVE-2023-36665”
  - Note the CVSS score of 9.8!
  - Why is it not applicable to this docker image?
- What about Secrets?
  - If not available, click on `Scan for Exposures` and examine results.
 
## Interact
- SSH into your EC2 instance and execute the commands
  - docker login
  ```
  docker login -u swampup@jfrog.com -p ${password} ${mothership}.jfrog.io IMAGE_ID=$(docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}" | awk '/demosecurity.jfrog.io\/containers\/ics/ {print $2}')
  ```
  - docker tagging
  ```
  docker tag ${IMAGE_ID} ${mothership}.jfrog.io/containers2/ics:latest2
  ```
  - docker push
  ```
  docker push ${mothership}.jfrog.io/containers2/ics:latest2
  ```
- Explore and Examine results.
