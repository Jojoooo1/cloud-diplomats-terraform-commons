
locals {
  common_labels = {
    owned-by   = "platform"
    managed-by = "terraform"
    env        = "non-prod"
  }
}

/******************************************
  Host Project
 *****************************************/
module "shared_host_dev_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.4"

  random_project_id        = true
  random_project_id_length = 4
  name                     = "shared-host-dev"

  org_id          = var.org_id
  billing_account = var.billing_id
  folder_id       = var.shared_folder_id

  enable_shared_vpc_host_project = true
  disable_services_on_destroy    = false

  activate_apis = [
    "servicenetworking.googleapis.com",
    "billingbudgets.googleapis.com",

    # Needed for bastion host
    "iap.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "networkmanagement.googleapis.com"
  ]

  labels = local.common_labels
}
