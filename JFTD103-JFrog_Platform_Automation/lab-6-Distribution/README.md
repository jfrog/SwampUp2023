# LAB 6 - Distribution of Artifacts

## Prerequisites
- Lab-0 - Configure JFrog CLI
- Lab-1 - Repository Provisioning
- Lab-2 - Role-Based Access Control
- Lab-3 - Build Integration and Properties
- Lab 5 - Artifactory Query Language
- Lab 6 - JFrog Security

### CREATE RELEASE BUNDLE
- Run ``jf ds rbc --spec=rb-spec.json rb_swamp 1.0.0 --desc="release candidate"``

### SIGN RELEASE BUNDLE
- Run ``jf ds rbs rb_swamp 1.0.0``

### DISTRIBUTE RELEASE BUNDLE
- Run ``jf ds rbd --dist-rules=dist-rules.json rb_swamp 1.0.0``
    - Note: We need to update ``dist-rules.json`` with the site name of the actual edge instance before running above command.


### CHALLENGE - Release Bundle [Optional]
- Scan Release Bundle using Xray HINT: Need to be added to watch
- Delete older Release Bundle