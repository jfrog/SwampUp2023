variable "ACCESS_TOKEN" {
  type    = string
  default = ""
}

variable "JFROG_URL" {
  type    = string
  default = ""
}


variable "TRUE" {
  type    = bool
  default = true
}

variable "FALSE" {
  type    = bool
  default = false
}

variable "finapp-docker-dev-local" {
  type = object({
    key                    = string
    project_key            = optional(string, null)
    description            = optional(string, null)
    xray_index             = optional(bool, true)
    repo_layout_ref        = optional(string, "simple-default")
    docker_tag_retention   = optional(number, 10)
    docker_max_unique_tags = optional(number, 10)
  })

  default = null
}

variable "auth-npm-dev-local" {
  type = object({
    key                 = string
    project_key         = optional(string, null)
    description         = optional(string, null)
    xray_index          = optional(bool, true)
    repo_layout_ref     = optional(string, "npm-default")
  })

  default = null
}

variable "payment-maven-dev-local" {
  type = object({
    key                  = string
    project_key          = optional(string, null)
    description          = optional(string, null)
    xray_index           = optional(bool, true)
    repo_layout_ref      = optional(string, "maven-2-default")
    max_unique_snapshots = optional(number, 10)
    handle_releases      = optional(bool, true)
    handle_snapshots     = optional(bool, true)
    suppress_pom_consistency_checks = optional(bool, false)
  })

  default = null
}


variable "remote_docker" {
  type = object({
    key                           = string
    project_key                   = optional(string, null)
    description                   = optional(string, null)
    xray_index                    = optional(bool, true)
    repo_layout_ref               = optional(string, "simple-default")
    enable_token_authentication   = optional(bool, true)
    external_dependencies_enabled = optional(bool, true)
    url                           = optional(string, "https://registry-1.docker.io/")
  })

  default = null
}

variable "remote_npm" {
  type = object({
    key                           = string
    project_key                   = optional(string, null)
    description                   = optional(string, null)
    xray_index                    = optional(bool, true)
    repo_layout_ref               = optional(string, "npm-default")
    url                           = optional(string, "https://registry.npmjs.org/")
    list_remote_folder_items      = optional(bool, true)
  })

  default = null
}


variable "remote_maven" {
  type = object({
    key                           = string
    project_key                   = optional(string, null)
    description                   = optional(string, null)
    xray_index                    = optional(bool, true)
    repo_layout_ref               = optional(string, "maven-2-default")
    url                           = optional(string, "https://repo1.maven.org/maven2/")
    fetch_jars_eagerly            = optional(bool, true)
    fetch_sources_eagerly         = optional(bool, true)
    suppress_pom_consistency_checks = optional(bool, false)
    reject_invalid_jars           = optional(bool, false)
  })

  default = null
}


variable "finapp-docker-dev-virtual" {
  type = object({
    key                    = string
    project_key            = optional(string, null)
    description            = optional(string, null)
    repo_layout_ref        = optional(string, "simple-default")
    repositories           = list(string)
    default_deployment_repo = optional(string, null)
  })
  default = null
}

variable "auth-npm-dev-virtual" {
  type = object({
    key                    = string
    project_key            = optional(string, null)
    description            = optional(string, null)
    repo_layout_ref        = optional(string, "npm-default")
    repositories           = list(string)
    default_deployment_repo = optional(string, null)
  })
  default = null
}

variable "payment-maven-dev-virtual" {
  type = object({
    key                    = string
    project_key            = optional(string, null)
    description            = optional(string, null)
    repo_layout_ref        = optional(string, "maven-2-default")
    repositories           = list(string)
    default_deployment_repo = optional(string, null)
  })
  default = null
}


