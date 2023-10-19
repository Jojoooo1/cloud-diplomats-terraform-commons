output "service_dev_project_id" {
  value       = module.service_dev_project.project_id
  description = "The name of the dev project"
}

output "service_test_project_id" {
  value       = module.service_test_project.project_id
  description = "The name of the test project"
}

