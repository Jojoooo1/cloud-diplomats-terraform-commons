
locals {
  common_labels = {
    owned-by   = "platform"
    managed-by = "terraform"
    env        = "prod"
  }
}

/******************************************
  OAuth Project
 *****************************************/
module "commons_oauth_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.4"

  random_project_id        = true
  random_project_id_length = 4
  name                     = "commons-oauth"

  org_id                      = var.org_id
  billing_account             = var.billing_id
  folder_id                   = var.commons_folder_id
  disable_services_on_destroy = false

  activate_apis = []

  labels = local.common_labels
}
