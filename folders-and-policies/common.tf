terraform {
  required_version = ">= 1.5.7"

  # Created using: rand="$(echo $RANDOM)" && gsutil mb -p <project-id> -l us -b on "gs://tf-state-$rand" && gsutil versioning set on "gs://tf-state-$rand"
  backend "gcs" {
    bucket = "tf-state-19914"
    prefix = "terraform/state/folders-and-policies"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.84.0"
    }
  }
}
