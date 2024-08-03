# Jenkins

**Plugins:**
* Pipeline stage view
* AnsiColor
* Pipeline As YAML (Incubated)
* Pipeline Utility Steps
* Nexus Artifact Uploader
* Rebuild
* Sonarqube plugin
* jenkins publisher ucd plugin


Restart Jenkins once plugins are installed

Configure aws credentials in jenkins agent. you should configure with normal user.

disable node monitoring since our instances are with less memory. add jenkins agent as node inside jenkins master.