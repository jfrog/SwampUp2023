## Xray Scan Lab
- Pre-requisites:
  - Navigate to the root of the npm project located in the [example](example) folder, specifically at 
    `SwampUp2023/JFTD101-Evolving-from-DevOps-to-DevSecOp/lab3-Xray-Scan/example/react-app/client`.
  - JFrog CLI installed and configured with the JFrog instance

<br/>

- On the UI:
  - Navigate to Artifactory > Repositories > `Create a Repository`"
  - Create a `npm` local repository -- `npm-local`
  - Create a `npm` remote repository -- `npm-remote` proxying npm registry
  - Create a `npm` virtual repository -- `npm-virtual`, include the above npm `local` and `remote` repos to be part of this `virtual` and then select the `local` repo to be the `‘default deployment repository’`
  - Turn on indexing of the repositories
    - Xray > Indexed resources > Add a repository > Select your `npm-local` and `npm-remote` repo in the left column 
      and bring it over to the right `Selected Repositories` column > Click `Save`
  



<br/>

- On your client machine: 
  - Go to the `root` directory of the npm project named `react-app` within the `'example'` folder
    - Use the  `cd SwampUp2023/JFTD101-Evolving-from-DevOps-to-DevSecOp/lab3-Xray-Scan/example/react-app/client` command to navigate there.
  - Lets publish a dummy build to the instance
    - `jf rt bp npm_build 01`
  - Verify the build info publish on the instance
    - Artifactory > Builds. Verify the build info you published in previous step.
  - Turn on indexing of the build
    - Xray > Indexed resources > Builds > Manage Builds > Select your build in the left column and bring it over to  the  right `Selected Build` column > Save

  - Navigate to Xray > Watches & Policies > Click on `New Policy`
    - Create a Security Policy named `security-policy`
    - Click on `New Rule`
    - Add a rule named `high`
      - In `Minimal Severity` select the option `High` from the dropdown as the criteria.
      - Under `Automatic Actions` select the `Fail Build` option and click `Save`
    - Click `Create` to create the Policy
  - Navigate to Xray > Watches & Policies > `Watches` tab > Click on `New Watch`
    - Create a Watch named `build-watch`
    - Click on `Add Builds`
    - Select the `npm_build` and move it over to the right `Selected Build` column 
    - Click Save
    - Click `Manage Policies`
    - In `Manage Watch Policies` Select the `security-policy` you created and move it to the right `Selected Policies` column and click Save
    - Click on `Create` to create the watch.
    
  - From the root of the project
    - Npm package manager integration
      - Run `jf npmc`
      - Resolve dependencies from Artifactory? (y/n)? y
      - Set Artifactory server ID [swampup]: hit Return
      - Set repository for dependencies resolution (press Tab for options): use Tab to select the virtual repository 
        `npm-virtual` and hit Return
      - Deploy project artifacts to Artifactory? (y/n)? y
      - Set Artifactory server ID [swampup] hit Return
      - Set repository for artifacts deployment (press Tab for options): use Tab to select the virtual repository 
        `npm-virtual` and hit Return
    - Npm install and build
      - `jf npm install --build-name npm_build --build-number 02`
    - Publish the built npm pkg to Artifactory
      - `jf npm publish --build-name npm_build --build-number 02`
    - Collect environment variables
      - `jf rt bce npm_build 02`
    - Collect information regarding git
      - `jf rt bag npm_build 02`
        <br/>
        <img src="jf_npm_publish_to_rt.png" alt="jf npm publish to RT" width="600" height="300">   
    - Publish build info
      - `jf rt bp npm_build 02`
        <br/>
        <img src="jf_rt_bp.png" alt="jf rt build-publish" width="600" height="100">
    - Verify the published build info on the instance and check the scan details in Builds > npm_build > 02 > Xray data
    - Scan the build info on your local by Xray - optional
      - `jf bs npm_build 02 --extended-table=true --vuln`
    - Run jf audit - optional
      - `jf audit --extended-table=true --fixable-only=true --licenses=true`
        <br/>
        <img src="jf_audit1.png" alt="jf audit" width="600" height="100">
        <img src="jf_audit2.png" alt="jf audit" width="600" height="300">
        <img src="jf_audit3.png" alt="jf audit" width="600" height="300">
    - You can capture the output of the jf command, including any error messages or codes it produces, and then 
      process that output in a script. 
      - Here's how you might do it using Bash scripting as an example:
        <br/> Note: The 2>&1 syntax redirects the standard error stream to the standard output stream so that both 
        streams are captured in the output variable.
```text
output=$(jf bs npm_build 02 --extended-table=true --fail=true 2>&1)
error_code=$?

echo "Command output:"
echo "$output"
echo "Error code: $error_code"
```
<br/>
<img src="capture_jf_output_and_error_code_1.png" alt="jf output ,error code, error message" width="600" height="300">
<img src="capture_jf_output_and_error_code_2.png" alt="jf output ,error code, error message" width="600" height="300">




