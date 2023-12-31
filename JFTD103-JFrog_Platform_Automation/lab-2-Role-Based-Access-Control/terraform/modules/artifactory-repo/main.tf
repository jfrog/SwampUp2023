terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "8.6.0"
    }
  }
}

provider "artifactory" {
  //  supply ACCESS_TOKEN / and JFROG_URL as env vars
  access_token = var.ACCESS_TOKEN
  url          = var.JFROG_URL
}


# Create Local Repositories
# Reference: https://registry.terraform.io/providers/jfrog/artifactory/latest/docs/resources/local
resource "artifactory_local_docker_v2_repository" "this" {
  count                = var.finapp-docker-dev-local != null ? 1 : 0
  key                  = var.finapp-docker-dev-local.key
  project_key          = var.finapp-docker-dev-local.project_key
  description          = var.finapp-docker-dev-local.description
  xray_index           = var.finapp-docker-dev-local.xray_index
  repo_layout_ref      = var.finapp-docker-dev-local.repo_layout_ref
  tag_retention        = var.finapp-docker-dev-local.docker_tag_retention
  max_unique_tags      = var.finapp-docker-dev-local.docker_max_unique_tags
  project_environments = ["DEV"]
  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}

resource "artifactory_local_npm_repository" "this" {
  count                   = var.auth-npm-dev-local != null ? 1 : 0
  key                     = var.auth-npm-dev-local.key
  project_key             = var.auth-npm-dev-local.project_key
  description             = var.auth-npm-dev-local.description
  xray_index              = var.auth-npm-dev-local.xray_index
  repo_layout_ref         = var.auth-npm-dev-local.repo_layout_ref
  project_environments    = ["DEV"]

  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}

resource "artifactory_local_maven_repository" "this" {
  count                           = var.payment-maven-dev-local != null ? 1 : 0
  key                             = var.payment-maven-dev-local.key
  project_key                     = var.payment-maven-dev-local.project_key
  description                     = var.payment-maven-dev-local.description
  xray_index                      = var.payment-maven-dev-local.xray_index
  repo_layout_ref                 = var.payment-maven-dev-local.repo_layout_ref
  max_unique_snapshots            = var.payment-maven-dev-local.max_unique_snapshots
  handle_releases                 = var.payment-maven-dev-local.handle_releases
  handle_snapshots                = var.payment-maven-dev-local.handle_snapshots
  suppress_pom_consistency_checks = var.payment-maven-dev-local.suppress_pom_consistency_checks
  project_environments            = ["DEV"]

  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}


# Create Remote Repositories
# Reference: https://registry.terraform.io/providers/jfrog/artifactory/latest/docs/resources/remote
resource "artifactory_remote_docker_repository" "this" {
  count                       = var.remote_docker != null ? 1 : 0
  key                         = var.remote_docker.key
  project_key                 = var.remote_docker.project_key
  description                 = var.remote_docker.description
  xray_index                  = var.remote_docker.xray_index
  repo_layout_ref             = var.remote_docker.repo_layout_ref
  enable_token_authentication = var.remote_docker.enable_token_authentication
  url                         = var.remote_docker.url
  project_environments        = ["DEV"]

  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}

resource "artifactory_remote_npm_repository" "this" {
  count                    = var.remote_npm != null ? 1 : 0
  key                      = var.remote_npm.key
  url                      = var.remote_npm.url
  project_key              = var.remote_npm.project_key
  description              = var.remote_npm.description
  repo_layout_ref          = var.remote_npm.repo_layout_ref
  xray_index               = var.remote_npm.xray_index
  list_remote_folder_items = var.remote_npm.list_remote_folder_items
  project_environments     = ["DEV"]

  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}


resource "artifactory_remote_maven_repository" "this" {
  count                           = var.remote_maven != null ? 1 : 0
  key                             = var.remote_maven.key
  url                             = var.remote_maven.url
  description                     = var.remote_maven.description
  repo_layout_ref                 = var.remote_maven.repo_layout_ref
  xray_index                      = var.remote_maven.xray_index
  fetch_jars_eagerly              = var.remote_maven.fetch_jars_eagerly
  fetch_sources_eagerly           = var.remote_maven.fetch_sources_eagerly
  suppress_pom_consistency_checks = var.remote_maven.suppress_pom_consistency_checks
  reject_invalid_jars             = var.remote_maven.reject_invalid_jars
  project_environments = ["DEV"]

  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}

# Create Virtual Repositories
# Reference: https://registry.terraform.io/providers/jfrog/artifactory/latest/docs/resources/virtual_docker_repository
resource "artifactory_virtual_docker_repository" "this" {
  count                   = var.finapp-docker-dev-virtual != null ? 1 : 0
  key                     = var.finapp-docker-dev-virtual.key
  project_key             = var.finapp-docker-dev-virtual.project_key
  description             = var.finapp-docker-dev-virtual.description
  repo_layout_ref         = var.finapp-docker-dev-virtual.repo_layout_ref
  repositories            = var.finapp-docker-dev-virtual.repositories
  default_deployment_repo = var.finapp-docker-dev-virtual.default_deployment_repo
  project_environments    = ["DEV"]
  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}

resource "artifactory_virtual_npm_repository" "this" {
  count                   = var.auth-npm-dev-virtual != null ? 1 : 0
  key                     = var.auth-npm-dev-virtual.key
  project_key             = var.auth-npm-dev-virtual.project_key
  description             = var.auth-npm-dev-virtual.description
  repo_layout_ref         = var.auth-npm-dev-virtual.repo_layout_ref
  repositories            = var.auth-npm-dev-virtual.repositories
  default_deployment_repo = var.auth-npm-dev-virtual.default_deployment_repo
  project_environments    = ["DEV"]
  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}

resource "artifactory_virtual_maven_repository" "this" {
  count                   = var.payment-maven-dev-virtual != null ? 1 : 0
  key                     = var.payment-maven-dev-virtual.key
  project_key             = var.payment-maven-dev-virtual.project_key
  description             = var.payment-maven-dev-virtual.description
  repo_layout_ref         = var.payment-maven-dev-virtual.repo_layout_ref
  repositories            = var.payment-maven-dev-virtual.repositories
  default_deployment_repo = var.payment-maven-dev-virtual.default_deployment_repo
  project_environments    = ["DEV"]
  #  lifecycle {
  #    ignore_changes = [project_environments]
  #  }
}


# Create Groups
# Reference: https://registry.terraform.io/providers/jfrog/artifactory/latest/docs/resources/group
resource "artifactory_group" "readers" {
  name  = "readers"
  admin_privileges = false
  auto_join = true
}

resource "artifactory_group" "security" {
  name  = "security"
  admin_privileges = false
}

resource "artifactory_group" "sre" {
  name  = "sre"
  admin_privileges = false
}

# Create Users
# Reference: https://registry.terraform.io/providers/jfrog/artifactory/latest/docs/resources/user
resource "artifactory_user" "user_james" {
  name   = "Mike"
  password = var.james_password
  email  = "mike@cjjfrog.com"
  groups   = ["readers"]
  depends_on = [
    artifactory_group.sre,
    artifactory_group.security,
    artifactory_group.readers
  ]
}

resource "artifactory_user" "user_peter" {
  name   = "Bob"
  password = var.peter_password
  email  = "bob@cjjfrog.com"
  groups   = ["readers"]
  depends_on = [
    artifactory_group.sre,
    artifactory_group.security,
    artifactory_group.readers
  ]
}

resource "artifactory_user" "user_filip" {
  name   = "Jennifer"
  password = var.peter_password
  email  = "jennifer@cjjfrog.com"
  groups   = ["readers"]
  depends_on = [
    artifactory_group.sre,
    artifactory_group.security,
    artifactory_group.readers
  ]
}

resource "artifactory_user" "user_dave" {
  name   = "Rolando"
  password = var.peter_password
  email  = "rolando@cjjfrog.com"
  groups   = ["readers"]
  depends_on = [
    artifactory_group.sre,
    artifactory_group.security,
    artifactory_group.readers
  ]
}

resource "artifactory_user" "user_mark" {
  name   = "Irene"
  password = var.peter_password
  email  = "irene@cjjfrog.com"
  groups   = ["readers"]
  depends_on = [
    artifactory_group.sre,
    artifactory_group.security,
    artifactory_group.readers
  ]
}

resource "artifactory_user" "user_matt" {
  name   = "Matt"
  password = var.peter_password
  email  = "matt@cjjfrog.com"
  groups   = ["readers"]
  depends_on = [
    artifactory_group.sre,
    artifactory_group.security,
    artifactory_group.readers
  ]
}

resource "artifactory_user" "user_support" {
  name   = "support"
  password = var.peter_password
  email  = "support@cjjfrog.com"
  groups   = ["readers"]
  depends_on = [
    artifactory_group.sre,
    artifactory_group.security,
    artifactory_group.readers
  ]
}

resource "artifactory_user" "user_deleteme" {
  name   = "deleteme"
  password = var.peter_password
  email  = "deleteme@cjjfrog.com"
  groups   = ["readers"]
  depends_on = [
    artifactory_group.readers
  ]
}


# Create a new Artifactory permission target called testpermission
# Reference: https://registry.terraform.io/providers/jfrog/artifactory/latest/docs/resources/permission_target
resource "artifactory_permission_target" "contractors-pt" {
  name = "contractors-pt"

  repo {
    includes_pattern = ["**remote**"]
    excludes_pattern = ["**prod**"]
    repositories     = []

    actions {
      groups {
        name        = "readers"
        permissions = ["read"]
      }
    }
  }

  build {
    includes_pattern = ["**"]
    repositories     = ["artifactory-build-info"]

    actions {
      groups {
        name        = "readers"
        permissions = ["read"]
      }
    }
  }
  depends_on = [
    artifactory_group.readers,
  ]
}

resource "artifactory_permission_target" "sre-pt" {
  name = "sre-pt"

  repo {
    includes_pattern = ["**"]
    excludes_pattern = ["**"]
    repositories     = []

    actions {
      groups {
        name        = "sre"
        permissions = ["read","write","annotate", "delete", "distribute"]
      }
    }
  }

  build {
    includes_pattern = ["**"]
    repositories     = ["artifactory-build-info"]

    actions {
      groups {
        name        = "sre"
        permissions = ["read","write","annotate", "delete", "distribute"]
      }
    }
  }

  depends_on = [
    artifactory_group.sre,
    artifactory_group.readers
  ]
}

resource "artifactory_permission_target" "security-pt" {
  name = "security-pt"

  repo {
    includes_pattern = ["**"]
    excludes_pattern = ["**"]
    repositories     = []

    actions {
      groups {
        name        = "security"
        permissions = ["read","managedXrayMeta"]
      }
    }
  }

  build {
    includes_pattern = ["**"]
    repositories     = ["artifactory-build-info"]

    actions {
      groups {
        name        = "security"
        permissions = ["read","managedXrayMeta"]
      }
    }
  }

  depends_on = [
    artifactory_group.security,
    artifactory_group.readers
  ]
}