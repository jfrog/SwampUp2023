# Required for Terraform 0.13 and up (https://www.terraform.io/upgrade-guides/0-13.html)
terraform {
  required_providers {
    xray = {
      source  = "registry.terraform.io/jfrog/xray"
      version = "1.11.1"
    }
  }
}

provider "xray" {
  access_token = var.ACCESS_TOKEN
  url = var.JFROG_URL
}

module "xrayModule" {
  source = "./module/xray"
}