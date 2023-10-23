terraform {
  required_version = ">= 1.5.7"

  backend "gcs" {
    bucket = "tf-state-18838"
    prefix = "terraform/state/projects/commons/oauth"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.84"
    }
  }
}
