output "dev_shared_folder" {
  description = "Development shared folder id"
  value       = google_folder.dev_shared.id
}
output "dev_services_folder" {
  description = "Development services folder id"
  value       = google_folder.dev_services.id
}

output "production_shared_folder" {
  description = "Production shared folder id"
  value       = google_folder.production_shared.id
}

output "production_services_folder" {
  description = "Production services folder id"
  value       = google_folder.production_services.id
}
