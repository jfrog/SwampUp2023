# Lab2 - Create Watch and check for violation
- Prerequisites
- Create Watch


## Prerequisites
- A SAAS Instance of JFrog. This will be provided as part of your enrollment to the Training class.
- Rescue script lab1/CREATE_REPO_RESCUE.sh executed.
- JFrog CLI is installed on the EC2 instance by running `jf -v`

<br/>

## CREATE WATCH
### CREATE WATCH using UI
- Navigate to the **Administration** Module, expand the **Xray** menu at the bottom and click on **Watches & Policies** menu item.
- Click on the Watch tab and create a new watch name `prod-watch`. 
- Under Manage Resources, add the repositories with prefix `jftd104` by clicking on the **Add Repositories** button 
- Add the two builds `swampup23_jftd104_mvn_pipeline` and `swampup23_jftd104_npm_pipeline` by clicking on the **Add Builds** button. 
- Add the `prod-security-policy` and `prod-license-policy` that we just created by clicking on the **Manage Policies** button.

   ![New Watch](images/2-1.gif)

<br/>

### CREATE WATCH using Automation
- Run 
```
  jf xr curl -XPOST "/api/v2/watches" -H "Content-Type: application/json" -d "@prod-watch.json"
```
- Confirm Watch named with `prod-watch` is created

<br/>
<br/>
<br/>

## CHALLENGE [Optional]
- Add Operational Risk policy to `prod-watch` Watch using UI
- Add Operational Risk policy to `prod-watch` Watch using Automation
