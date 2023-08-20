output "id" {
  value       = module.lb.id
  description = "ID of this loadbalancer"
}

output "name" {
  value       = module.lb.name
  description = "Name of this loadbalancer"
}

output "location" {
  value       = module.lb.location
  description = "Location of this loadbalancer"
}

output "ipv4" {
  value       = module.lb.ipv4
  description = "IPV4 of this loadbalancer"
}

output "labels" {
  value       = module.lb.labels
  description = "Resource labels"
}
