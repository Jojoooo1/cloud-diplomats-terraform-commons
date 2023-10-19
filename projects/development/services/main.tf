
locals {
  dev_services_folder_id = data.terraform_remote_state.organization.outputs.dev_services_folder
  host_project_id        = data.terraform_remote_state.host_project.outputs.host_project_id
  shared_vpc_subnets     = data.terraform_remote_state.shared_vpc.outputs.subnets_self_links

  common_labels = {
    owned-by   = "platform"
    managed-by = "terraform"
    env        = "non-prod"
  }
}

/******************************************
  Service Project
 *****************************************/
module "service_dev_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.3"

  random_project_id        = true
  random_project_id_length = 4
  name                     = "cl-dpl-service-dev"

  org_id          = var.org_id
  billing_account = var.billing_id
  folder_id       = local.dev_services_folder_id

  svpc_host_project_id        = local.host_project_id
  shared_vpc_subnets          = local.shared_vpc_subnets
  disable_services_on_destroy = false

  activate_apis = [
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "sqladmin.googleapis.com",
    "logging.googleapis.com",
    "secretmanager.googleapis.com",
    "iap.googleapis.com",
  ]

  labels = local.common_labels
}

module "service_test_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.3"

  random_project_id        = true
  random_project_id_length = 4
  name                     = "cl-dpl-service-test"

  org_id          = var.org_id
  billing_account = var.billing_id
  folder_id       = local.dev_services_folder_id

  svpc_host_project_id        = local.host_project_id
  shared_vpc_subnets          = local.shared_vpc_subnets
  disable_services_on_destroy = false

  activate_apis = [
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "sqladmin.googleapis.com",
    "logging.googleapis.com",
    "secretmanager.googleapis.com",
    "iap.googleapis.com",
  ]

  labels = local.common_labels
}

