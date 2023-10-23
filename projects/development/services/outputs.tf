output "service_dev_project" {
  value       = module.service_dev_project.project_id
  description = "The ID of the dev project"
}

output "service_test_project" {
  value       = module.service_test_project.project_id
  description = "The ID of the test project"
}

