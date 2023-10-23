terraform {
  required_version = ">= 1.5.7"

  backend "gcs" {
    bucket = "tf-state-18838"
    prefix = "terraform/state/projects/development/services"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.84"
    }
  }
}

# data "terraform_remote_state" "shared_vpc" {
#   backend = "gcs"

#   config = {
#     bucket = "tf-state-16958"
#     prefix = "terraform/state/network/shared-host"
#   }
# }
