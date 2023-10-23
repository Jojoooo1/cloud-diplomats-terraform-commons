<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.84 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_dev_project"></a> [service\_dev\_project](#module\_service\_dev\_project) | terraform-google-modules/project-factory/google | 14.3 |
| <a name="module_service_test_project"></a> [service\_test\_project](#module\_service\_test\_project) | terraform-google-modules/project-factory/google | 14.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_id"></a> [billing\_id](#input\_billing\_id) | GCP Billing ID | `string` | n/a | yes |
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Host project ID | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |
| <a name="input_service_folder_id"></a> [service\_folder\_id](#input\_service\_folder\_id) | Service folder ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_dev_project"></a> [service\_dev\_project](#output\_service\_dev\_project) | The ID of the dev project |
| <a name="output_service_test_project"></a> [service\_test\_project](#output\_service\_test\_project) | The ID of the test project |
<!-- END_TF_DOCS -->