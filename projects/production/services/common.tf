terraform {
  required_version = ">= 1.5.7"

  backend "gcs" {
    bucket = "tf-state-18838"
    prefix = "terraform/state/projects/production/services"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.4"
    }
  }
}

# data "terraform_remote_state" "shared_vpc" {
#   backend = "gcs"

#   config = {
#     bucket = "tf-state-xxxx"
#     prefix = "terraform/state/network/shared-vpc"
#   }
# }
