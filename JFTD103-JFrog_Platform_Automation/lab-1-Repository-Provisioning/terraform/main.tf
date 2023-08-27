terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "8.6.0"
    }
  }
}


# remote
module "remote" {
  source = "./modules/artifactory-repo/"
  remote_docker = {
    key         = "docker-remote"
  }
  remote_maven = {
    key         = "maven-remote"
  }
  remote_npm   = {
    key         = "npm-remote"
  }
}

module "local" {
  source = "./modules/artifactory-repo/"
  finapp-docker-dev-local = {
    key         = "finapp-docker-dev-local"
  }
  payment-maven-dev-local = {
    key         = "payment-maven-dev-local"
  }
  auth-npm-dev-local   = {
    key         = "auth-npm-dev-local"
  }
}