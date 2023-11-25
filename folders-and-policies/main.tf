locals {

  policy_for                = "organization"
  organization_folder_id    = "organizations/${var.org_id}"
  domain_restricted_contact = "@${var.domain}"

  boolean_type_organization_policies = toset([
    // Access management policies:
    "storage.uniformBucketLevelAccess",
    "compute.requireOsLogin",

    // IAM policies:
    "iam.automaticIamGrantsForDefaultServiceAccounts",
    "iam.disableServiceAccountKeyCreation",
    "iam.disableServiceAccountKeyUpload",

    // After you create a single centralized workload identity pool:
    // constraints/iam.workloadIdentityPoolProviders

    // VM policies:
    "compute.disableNestedVirtualization",
    "compute.disableSerialPortAccess",
    "compute.disableGuestAttributesAccess",

    // Network policies:
    "compute.skipDefaultNetworkCreation",
    "compute.restrictXpnProjectLienRemoval",
    "compute.disableVpcExternalIpv6",
    "compute.setNewProjectDefaultToZonalDNSOnly",

    // SQL network policies:
    "sql.restrictPublicIp",
    "sql.restrictAuthorizedNetworks",
  ])

  common_labels = {
    owned-by   = "platform"
    managed-by = "terraform"
    env        = "prod"
  }
}

/******************************************
  Org policies
*******************************************/
module "organization_policies_type_boolean" {
  source   = "terraform-google-modules/org-policy/google"
  version  = "5.2.2"
  for_each = local.boolean_type_organization_policies

  organization_id = var.org_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/${each.value}"
}

/******************************************
  Storage policies
*******************************************/
module "public_access_prevention" {
  source  = "terraform-google-modules/org-policy/google"
  version = "5.2.2"

  organization_id = var.org_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/storage.publicAccessPrevention"

  # Can only be configurated after the public folder has been created
  # exclude_folders = [google_folder.public.id]

  # depends_on = [google_folder.public]
}

/******************************************
  Compute policies
*******************************************/
module "org_vm_external_ip_access" {
  source  = "terraform-google-modules/org-policy/google//modules/restrict_vm_external_ips"
  version = "5.2.2"

  organization_id = var.org_id
  policy_for      = local.policy_for
}

module "restrict_protocol_fowarding" {
  source  = "terraform-google-modules/org-policy/google"
  version = "5.2.2"

  organization_id   = var.org_id
  policy_for        = local.policy_for
  policy_type       = "list"
  allow             = ["INTERNAL"]
  allow_list_length = 1
  constraint        = "constraints/compute.restrictProtocolForwardingCreationForTypes"
}

/******************************************
  IAM policies
*******************************************/
module "org_domain_restricted_sharing" {
  source  = "terraform-google-modules/org-policy/google//modules/domain_restricted_sharing"
  version = "5.2.2"

  organization_id  = var.org_id
  policy_for       = local.policy_for
  domains_to_allow = [var.domain]
}

/******************************************
  Essential Contacts policies
*******************************************/
module "domain_restricted_contacts" {
  source  = "terraform-google-modules/org-policy/google"
  version = "5.2.2"

  organization_id   = var.org_id
  policy_for        = local.policy_for
  policy_type       = "list"
  allow_list_length = 1
  allow             = [local.domain_restricted_contact]
  constraint        = "constraints/essentialcontacts.allowedContactDomains"
}

/******************************************
  Dev folders
 *****************************************/
resource "google_folder" "dev" {
  display_name = "development"
  parent       = local.organization_folder_id
}
resource "google_folder" "dev_shared" {
  display_name = "shared"
  parent       = google_folder.dev.name
}
resource "google_folder" "dev_services" {
  display_name = "services"
  parent       = google_folder.dev.name
}

/******************************************
  Production folders
 *****************************************/
resource "google_folder" "production" {
  display_name = "production"
  parent       = local.organization_folder_id
}
resource "google_folder" "production_shared" {
  display_name = "shared"
  parent       = google_folder.production.name
}
resource "google_folder" "production_services" {
  display_name = "services"
  parent       = google_folder.production.name
}

/******************************************
  Public folders (public assets like CDN, public bucket etc.)
 *****************************************/
resource "google_folder" "public" {
  display_name = "public"
  parent       = local.organization_folder_id
}


/******************************************
  Commons Project
 *****************************************/
module "commons_projects" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.4"

  random_project_id        = true
  random_project_id_length = 4
  name                     = "commons-projects"

  org_id                      = var.org_id
  billing_account             = var.billing_id
  folder_id                   = var.commons_folder_id
  disable_services_on_destroy = false

  activate_apis = []

  labels = local.common_labels
}
