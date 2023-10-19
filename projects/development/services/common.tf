terraform {
  required_version = ">= 1.5.7"

  backend "gcs" {
    bucket = "tf-state-16824"
    prefix = "terraform/state/projects/development/services"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.83"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.83"
    }
  }
}

data "terraform_remote_state" "organization" {
  backend = "gcs"

  config = {
    bucket = "tf-state-16824"
    prefix = "terraform/state/organization"
  }
}

data "terraform_remote_state" "host_project" {
  backend = "gcs"

  config = {
    bucket = "tf-state-16824"
    prefix = "terraform/state/projects/development/shared/host-project"
  }
}

data "terraform_remote_state" "shared_vpc" {
  backend = "gcs"

  config = {
    bucket = "tf-state-16958"
    prefix = "terraform/state/network/shared-host"
  }
}
