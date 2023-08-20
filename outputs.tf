output "id" {
  value       = hcloud_load_balancer.lb.id
  description = "ID of this loadbalancer"
}

output "name" {
  value       = hcloud_load_balancer.lb.name
  description = "Name of this loadbalancer"
}

output "location" {
  value       = hcloud_load_balancer.lb.location
  description = "Location of this loadbalancer"
}

output "ipv4" {
  value       = hcloud_load_balancer.lb.ipv4
  description = "IPV4 of this loadbalancer"
}

output "labels" {
  value       = hcloud_load_balancer.lb.labels
  description = "Resource labels"
}
