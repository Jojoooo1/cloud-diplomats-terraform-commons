
locals {
  common_labels = {
    owned-by   = "platform"
    managed-by = "terraform"
    env        = "prod"
  }
}

/******************************************
  Workload identity federation Project:
  https://cloud.google.com/iam/docs/best-practices-for-using-workload-identity-federation

  1. Create identity pool and a provider
  2. create a service account with iam.workloadIdentityUser role
  3. and principal with:
  
  Single identity: 	principal://iam.googleapis.com/projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL_ID/subject/SUBJECT_ATTRIBUTE_VALUE
  All identities in a group: 	principalSet://iam.googleapis.com/projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL_ID/group/GROUP_ID
  (recommended) All identities with a specific attribute value: 	principalSet://iam.googleapis.com/projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL_ID/attribute.ATTRIBUTE_NAME/ATTRIBUTE_VALUE

 *****************************************/
module "commons_workload_identity_federation_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.4"

  random_project_id        = true
  random_project_id_length = 2
  name                     = "commons-wrkld-identity-fed"

  org_id                      = var.org_id
  billing_account             = var.billing_id
  folder_id                   = var.commons_folder_id
  disable_services_on_destroy = false

  activate_apis = [
    "iam.googleapis.com",
    "sts.googleapis.com",
    "iamcredentials.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]

  labels = local.common_labels
}


