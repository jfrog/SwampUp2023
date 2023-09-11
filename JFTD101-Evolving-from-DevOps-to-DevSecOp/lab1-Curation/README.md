## Curation lab
### Pre-requisites:
  * Latest [npm client](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

### On the UI
  * Let’s create a new npm remote repo:
    * Navigate to Admin panel > Repositories > Repositories.
    * Click on Add Repositories at the top right, select Remote Repository and  pick type ‘npm’
    * Type the repo name 'npm-remote-curation' in the Repository Key field and hit Create Remote Repository 

<br/>

  * Let’s turn on Curation:
    * Navigate to Admin panel > Curation > General and turn on Curation
    <br/><img src="admin_curation.jpg" alt="admin->curation" width="400" height="300">
    <br/><img src="curation_on.jpg" alt="turn on Curation" width="400" height="300">
      <br/>
    * Navigate to Admin panel > Curation > Curated repositories and turn on the State option on the just created 
      'npm-remote-curation' repository
    <img src="curated_repos.jpg" alt="curated repos" width="600" height="300">
    

<br/>

  * Let’s create a Curation policy:
    * Navigate to Application panel > Curation > Policies management
      * Click on Create Policy at the top right
      * Give the Policy the name `'block malicious pkgs'`
      * Select the just created repo by selecting Specific and then pick the repo 'npm-remote-curation' and click Save
      * Select the first condition in the list called `‘Malicious package’`
      * Leave the waivers section blank
      * In the Actions section, pick `‘Block’`
      * Click on the Save Policy button
      <img src="block_malicious_pkgs.jpg" alt="block malicious pkgs" width="600" height="300">
<br/>

### In the terminal
  * Let’s configure the npm client:
      * Navigate to Applications panel > Artifactory > Artifacts
      * Find the {npm-remote-curation} repo you just created in the list
      * Click on it and then click on the `Set Me Up` button at the top right
      * In the Configure tab, click `Dismiss` to find the config instructions
    or
      * Enter your credentials and click on `"Generate Token & Create Instructions"`
        <img src="npm_setMeUp_with_token.jpg" alt="npm Set Me Up with token" width="600" height="300">
      * Copy and run instructions in your terminal to config your npm client  
   Example:  Paste the generated configuration details for your  ~/.npmrc file when using unix (or if using 
        Windows the %USERPROFILE%/.npmrc)
<br/>
        <img src="npmrc_contents.jpg" alt=".npmrc contents" width="600" height="300">
<br/>

* Run `npm install cors.js` - An example of a malicious pkg
  
Note: The generated configuration details for your  ~/.npmrc needs a small correction. You  will be prompted by 
    the above command to fix it by running `npm config fix` . After you run `npm config fix`  the `_auth` in the ~/.npmrc is 
    prefixed by the fully qualified `npm-remote-curation` repo path as shown below:
    <img src="npm_config_fix.jpg" alt="npm config fix" width="600" height="200">
    <img src="npmrc_auth_prefix_fixed.jpg" alt=".npmrc _auth prefix fixed" width="600" height="100">
  
Now rerun the `npm install cors.js`.
* Check if the command fails
<br/>
<img src="curation_403_response.jpg" alt="curation 403 repsonse" width="600" height="200">
<br/>

* Run npm install cors - an example of a non-malicious pkg
  * Check for success





