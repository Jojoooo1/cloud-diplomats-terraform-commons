variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "org_id" {
  description = "GCP Organization ID"
  type        = string
}

variable "billing_id" {
  description = "GCP Billing ID"
  type        = string
}

variable "domain" {
  description = "Domains to allow for IAM policy"
  type        = string
}

variable "commons_folder_id" {
  description = "Commons folder ID"
  type        = string
}
