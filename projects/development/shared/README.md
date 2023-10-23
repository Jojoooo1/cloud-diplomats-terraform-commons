<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.84 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.84 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_shared_host_dev_project"></a> [shared\_host\_dev\_project](#module\_shared\_host\_dev\_project) | terraform-google-modules/project-factory/google | 14.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_id"></a> [billing\_id](#input\_billing\_id) | GCP Billing ID | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |
| <a name="input_shared_folder_id"></a> [shared\_folder\_id](#input\_shared\_folder\_id) | Shared folder ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_host_project_id"></a> [host\_project\_id](#output\_host\_project\_id) | The ID of the host project |
<!-- END_TF_DOCS -->