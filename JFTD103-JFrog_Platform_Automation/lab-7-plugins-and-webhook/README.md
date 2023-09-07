# LAB 7 - JFROG CLI Plugin, Webhooks and User Plugins

## JFrog CLI Plugin
JFrog CLI Plugins allow enhancing the functionality of JFrog CLI to meet the specific user and organization needs. The source code of a plugin is maintained as an open source Go project on GitHub. All public plugins are registered in [JFrog CLI's Plugins Registry](https://github.com/jfrog/jfrog-cli-plugins-reg). We encourage you, as developers, to create plugins and share them publicly with the rest of the community. When a plugin is included in the registry, it becomes publicly available and can be installed using JFrog CLI. Read the [JFrog CLI Plugins Developer Guide](https://github.com/jfrog/jfrog-cli/blob/v2/guides/jfrog-cli-plugins-developer-guide.md#JFrog-CLI-Plugin-Developer-Guide) if you wish to create and publish your own plugins.

<br />


### [LIVE LOGS](https://github.com/jfrog/live-logs#readme)
The JFrog Platform includes an integrated Live Logs plugin, which allows customers to get the JFrog product logs (Artifactory, Xray, Mission Control, Distribution, and Pipelines) using the JFrog CLI Plugin. The plugin also provides the ability to `cat` and `tail -f` any log on any product node.

- Run ``jf plugin install live-logs``

- Run ``jf live-logs config rt swampup``

- Run ``jf live-logs logs -i``
    - Select JFrog CLI product id
        - `rt`
    - Select JFrog CLI server id
        - `swampup`
    - Select Node Id
        - `{{NODE0}}`
        - `{{NODE1}}`
    - Select log name
        - `{{SELECT LOG FILE FOR TAIL}}`

- Run ``jfrog live-logs logs rt SUP016 {{NODE}}-0 {{SELECT LOG FILE FOR TAIL}}.log``

<br />

### [scan-log4j-versions](https://github.com/jfrog/log4j-tools/tree/main/scan_log4j_versions/jfrog_cli_plugin#readme)
This plugin recursively scans the root_folder for .jar and .war files; For every file that is detected, the plugin looks for a *log4j/core/net/JndiManager.class and *log4j/core/lookup/JndiLookup.class (recursively in each .jar file). If at least one of the classes is found, the tool attempts to fingerprint its version (including some variations found in patches and backport patches) in order to report whether the code is vulnerable.

```json
- Arguments:
  - root-folder - Directory to start the recursive scan from
- Flags:
  exclude: do not scan the specified directories
```

- Run ``jf plugin install scan-log4j-versions``

- Run ``jf scan-log4j-versions run maven-example``

<br />
<br />



## JFrog Webhooks

There are two types of [Webhooks](https://jfrog.com/help/r/jfrog-platform-administration-documentation/webhooks) (`Platform configuration > Platform Management > Webhooks`):
- **[Predefined](https://jfrog.com/help/r/jfrog-platform-administration-documentation/predefined-webhooks)**: These are Webhooks with predefined payloads, which cannot be customized for specific vendors. Users, however, can customize the target URL and add HTTP headers.
  - In UI, Platform Configuration -> New Webhook -> Predefined (Default) -> URL & Events -> Create
    - NOTE: we can use [webhook](https://webhook.site/) to review the payload
- **[Custom](https://jfrog.com/help/r/jfrog-platform-administration-documentation/custom-webhooks)**: These are Webhooks whose HTTP request headers and payload can be fully customized to adapt to any target service, such as GitHub actions, Gitlab pipelines, Jenkins jobs, Slack, and more. Custom Webhooks trigger events with the format expected by the vendor.
  - In UI, Platform Configuration -> New Webhook -> Custom -> URL & Events -> Create 
    - NOTE: we can use [webhook](https://webhook.site/) to review the payload

<br />
<br />

## JFrog Worker [BETA]

- JFrog [Workers](https://jfrog.com/help/r/jfrog-platform-administration-documentation/workers) (Typescript Code) is a service in the JFrog Platform that provides a serverless execution environment. You can create workers that react to events in the JFrog Platform similar to AWS Lambda services.
- Workers service provides more flexibility to accomplish your use cases.
  - like Before Download, After Download, Before Upload, After Create, After Move, After Build Info Save

<br />
<br />

## JFrog User Plugin [Optional]

Extend Artifactory's behavior with your own plugins written in [Groovy](http://groovy-lang.org/).

[User plugins](https://jfrog.com/help/r/jfrog-integrations-documentation/user-plugins) are used for running user's code in Artifactory. Plugins allow you to perform the following tasks:
- Add scheduled tasks
- Extend Artifactory with your own security realms
- Change resolution rules 
- Manipulate downloaded content 
- Respond to any storage events on items and properties 
- Deploy and query artifacts and metadata 
- Perform searches 
- Query security information 
- Invoke custom commands via REST 
- Execute custom promotion logic 
- Provide information and strategies for Artifactory's Build Servers Plugins.


