terraform {
  required_version = ">= 1.5.7"

  backend "gcs" {
    bucket = "tf-state-16824"
    prefix = "terraform/state/projects/commons/oauth"
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
