# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}

output "username" {
  value = "${random_string.username.result}"
}

output "password" {
  value = "${random_string.password.result}"
}

output "endpoint" {
  value       = "${google_container_cluster.primary.endpoint}"
  description = "The IP address of this cluster's Kubernetes master"
}