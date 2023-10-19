
locals {
  dev_shared_folder_id = data.terraform_remote_state.organization.outputs.dev_shared_folder

  common_labels = {
    owned-by   = "platform"
    managed-by = "terraform"
    env        = "non-prod"
  }
}

/******************************************
  Host Project
 *****************************************/
module "shared_dev_host_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.3"

  random_project_id        = true
  random_project_id_length = 4
  name                     = "cl-dpl-shared-dev"

  org_id          = var.org_id
  billing_account = var.billing_id
  folder_id       = local.dev_shared_folder_id

  enable_shared_vpc_host_project = true
  disable_services_on_destroy    = false

  activate_apis = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "logging.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = local.common_labels
}

/******************************************
  Service Project Creation
 *****************************************/
# module "service-project" {
#   source = "../../modules/svpc_service_project"

#   name              = var.service_project_name
#   random_project_id = false

#   org_id          = var.organization_id
#   folder_id       = var.folder_id
#   billing_account = var.billing_account

#   shared_vpc         = module.host-project.project_id
#   shared_vpc_subnets = module.vpc.subnets_self_links

#   activate_apis = [
#     "compute.googleapis.com",
#     "container.googleapis.com",
#     "dataproc.googleapis.com",
#     "dataflow.googleapis.com",
#   ]

#   disable_services_on_destroy = false
# }

