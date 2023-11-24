
locals {
  # shared_vpc_subnets = data.terraform_remote_state.shared_vpc.outputs.subnets_self_links

  common_labels = {
    owned-by   = "platform"
    managed-by = "terraform"
    env        = "prod"
  }
}

/******************************************
  Service Project
 *****************************************/
module "service_prod_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.4"

  random_project_id        = true
  random_project_id_length = 4
  name                     = "service-prod"

  org_id          = var.org_id
  billing_account = var.billing_id
  folder_id       = var.service_folder_id

  # svpc_host_project_id = var.host_project_id
  # shared_vpc_subnets          = local.shared_vpc_subnets
  disable_services_on_destroy = false

  activate_apis = [
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "containersecurity.googleapis.com",
    "sqladmin.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "secretmanager.googleapis.com",
    "iap.googleapis.com",
  ]

  labels = local.common_labels
}
