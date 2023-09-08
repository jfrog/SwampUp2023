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


module "virtual" {
  source = "./modules/artifactory-repo/"
  finapp-docker-dev-virtual = {
    key          = "finapp-docker-dev1-virtual"
    repositories = [
      module.local.finapp-docker-dev-local,
      module.remote.remote_docker
    ]
    default_deployment_repo = "finapp-docker-dev-local"
  }
  auth-npm-dev-virtual = {
    key          = "auth-npm-dev-virtual"
    repositories = [ "auth-npm-dev-local", "npm-remote"]
    default_deployment_repo = "auth-npm-dev-local"
  }
  payment-maven-dev-virtual = {
    key          = "payment-maven-dev-virtual"
    repositories = [
      module.local.payment-maven-dev-local,
      module.remote.remote_maven
    ]
    default_deployment_repo = "payment-maven-dev-local"
  }

}