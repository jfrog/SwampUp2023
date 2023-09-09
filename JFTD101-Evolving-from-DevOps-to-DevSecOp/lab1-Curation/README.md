## Curation lab
### Pre-requisites:
  * Latest npm client

### On the UI
  * Let’s create a new npm remote repo:
    * Navigate to Admin panel > Repositories > Repositories.
    * Click on Add Repositories at the top right, select Remote Repository and  pick type ‘npm’
    * Type the repo name 'npm-remote-curation' in the Repository Key field and hit Create Remote Repository 

<br/>

  * Let’s turn on Curation:
    * Navigate to Admin panel > Curation > General and turn on Curation
    * Navigate to Admin panel > Curation > Curated repositories and turn on the caution on the just created 'npm-remote-curation' repository

<br/>

  * Let’s create a Curation policy:
    * Navigate to Application panel > Curation > Policies management
      * Click on Create Policy at the top right
      * Give the Policy the name 'block malicious pkgs'
      * Select the just created repo by selecting Specific and then pick the repo 'npm-remote-curation' and click Save
      * Select the first condition in the list called ‘Malicious package’
      * Leave the waivers section blank
      * In the Actions section, pick ‘Block’
      * Click on the Save Policy button

<br/>

### In the terminal
  * Let’s configure the npm client:
      * Navigate to Applications panel > Artifactory > Artifacts
      * Find the {npm-remote-curation} repo you just created in the list
      * Click on it and then click on the Set Me Up button at the top right
      * In the Configure tab, click Dismiss to find the config instructions
      * Copy and run instructions in your terminal to config your npm client  

<br/>

* Run npm install cors.js - An example of a malicious pkg
  * Check if the command fails

<br/>

* Run npm install cors - an example of a non-malicious pkg
  * Check for success





