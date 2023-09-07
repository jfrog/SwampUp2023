terraform {
  required_providers {
    xray = {
      source  = "registry.terraform.io/jfrog/xray"
      version = "1.11.1"
    }
  }
}

resource "xray_security_policy" "security_policy" {
  name        = "security-prod"
  description = "Production Security Policy Description"
  type        = "security"

  rule {
    name     = "critical-severity"
    priority = 1

    criteria {
      min_severity = "Critical"
    }

    actions {
      webhooks                           = []
      mails                              = []
      block_release_bundle_distribution  = false
      fail_build                         = false
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled
      build_failure_grace_period_in_days = 0     // use only if fail_build is enabled

      block_download {
        unscanned = true
        active    = true
      }
    }
  }

  rule {
    name     = "high-severity"
    priority = 2

    criteria {
      min_severity = "High"
    }

    actions {
      webhooks                           = []
      mails                              = []
      block_release_bundle_distribution  = false
      fail_build                         = false
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled
      build_failure_grace_period_in_days = 0     // use only if fail_build is enabled

      block_download {
        unscanned = true
        active    = true
      }
    }
  }
}


resource "xray_license_policy" "license_policy" {
  name        = "license-prod"
  description = "License policy, banned certain licenses"
  type        = "license"

  rule {
    name     = "License_rule"
    priority = 1

    criteria {
      allowed_licenses         = []
      banned_licenses = ["GPL-1.0","GPL-2.0"]
      allow_unknown            = false
      multi_license_permissive = true
    }

    actions {
      webhooks                           = []
      mails                              = []
      block_release_bundle_distribution  = false
      fail_build                         = false
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled
      custom_severity                    = "Critical"
      build_failure_grace_period_in_days = 0 // use only if fail_build is enabled

      block_download {
        unscanned = true
        active    = true
      }
    }
  }
}

resource "xray_operational_risk_policy" "high_risk" {
  name        = "operational-risk-prod"
  description = "Operational Risk policy"
  type        = "operational_risk"

  rule {
    name     = "op_risk_custom_rule"
    priority = 1

    criteria {
      op_risk_min_risk = "High"
    }

    actions {
      webhooks                           = []
      mails                              = []
      block_release_bundle_distribution  = false
      fail_build                         = false
      notify_watch_recipients            = false
      notify_deployer                    = false
      create_ticket_enabled              = false // set to true only if Jira integration is enabled
      build_failure_grace_period_in_days = 0 // use only if fail_build is enabled

      block_download {
        unscanned = true
        active    = true
      }
    }
  }
}