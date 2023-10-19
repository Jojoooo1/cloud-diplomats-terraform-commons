<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.83 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.83 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_commons_oauth_project"></a> [commons\_oauth\_project](#module\_commons\_oauth\_project) | terraform-google-modules/project-factory/google | 14.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_id"></a> [billing\_id](#input\_billing\_id) | GCP Billing ID | `string` | n/a | yes |
| <a name="input_commons_folder_id"></a> [commons\_folder\_id](#input\_commons\_folder\_id) | Commons folder ID | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_commons_project_id"></a> [commons\_project\_id](#output\_commons\_project\_id) | The name of the dns project |
<!-- END_TF_DOCS -->