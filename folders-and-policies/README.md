# Boostrap organization - folders and policies

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.83 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.83 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.83 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_domain_restricted_contacts"></a> [domain\_restricted\_contacts](#module\_domain\_restricted\_contacts) | terraform-google-modules/org-policy/google | 5.2.2 |
| <a name="module_org_domain_restricted_sharing"></a> [org\_domain\_restricted\_sharing](#module\_org\_domain\_restricted\_sharing) | terraform-google-modules/org-policy/google//modules/domain_restricted_sharing | 5.2.2 |
| <a name="module_org_vm_external_ip_access"></a> [org\_vm\_external\_ip\_access](#module\_org\_vm\_external\_ip\_access) | terraform-google-modules/org-policy/google//modules/restrict_vm_external_ips | 5.2.2 |
| <a name="module_organization_policies_type_boolean"></a> [organization\_policies\_type\_boolean](#module\_organization\_policies\_type\_boolean) | terraform-google-modules/org-policy/google | 5.2 |
| <a name="module_public_access_prevention"></a> [public\_access\_prevention](#module\_public\_access\_prevention) | terraform-google-modules/org-policy/google | 5.2 |
| <a name="module_restrict_protocol_fowarding"></a> [restrict\_protocol\_fowarding](#module\_restrict\_protocol\_fowarding) | terraform-google-modules/org-policy/google | 5.2.2 |

## Resources

| Name | Type |
|------|------|
| [google_folder.dev](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.dev_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.dev_shared](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.production](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.production_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.production_shared](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.public](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Domains to allow for IAM policy | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dev_services_folder"></a> [dev\_services\_folder](#output\_dev\_services\_folder) | Development services folder id |
| <a name="output_dev_shared_folder"></a> [dev\_shared\_folder](#output\_dev\_shared\_folder) | Development shared folder id |
| <a name="output_production_services_folder"></a> [production\_services\_folder](#output\_production\_services\_folder) | Production services folder id |
| <a name="output_production_shared_folder"></a> [production\_shared\_folder](#output\_production\_shared\_folder) | Production shared folder id |
<!-- END_TF_DOCS -->
