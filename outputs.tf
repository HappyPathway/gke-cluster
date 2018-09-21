output "master_version" {
  value       = "${module.gke-cluster.master_version}"
  description = "The current version of the master in the cluster."
}

output "endpoint" {
  value       = "${module.gke-cluster.endpoint}"
  description = "The IP address of this cluster's Kubernetes master"
}

output "instance_group_urls" {
  value       = "${module.gke-cluster.instance_group_urls}"
  description = "List of instance group URLs which have been assigned to the cluster"
}

output "maintenance_window" {
  value       = "${module.gke-cluster.maintenance_window}"
  description = "Duration of the time window, automatically chosen to be smallest possible in the given scenario. Duration will be in RFC3339 format PTnHnMnS"
}

output "username" {
  value       = "${module.gke-cluster.username}"
  description = "The username to login on the master Kubernetes"
}

output "password" {
  value       = "${module.gke-cluster.password}"
  description = "The password to login on the master Kubernetes"
}

output "client_certificate" {
  value       = "${module.gke-cluster.client_certificate}"
  description = "Base64 encoded public certificate used by clients to authenticate to the cluster endpoint"
}

output "client_key" {
  value       = "${module.gke-cluster.client_key}"
  description = "Base64 encoded private key used by clients to authenticate to the cluster endpoint"
}

output "cluster_ca_certificate" {
  value       = "${module.gke-cluster.cluster_ca_certificate}"
  description = "Base64 encoded public certificate that is the root of trust for the cluster"
}

output "cluster_name" {
  value       =  "${google_container_cluster.new_container_cluster.name}"
  description =  "The full name of this Kubernetes cluster"
}

output "gcr_url" {
  value       = "${google_container_cluster.registry.repository_url}"
  description = "This data source fetches the project name, and provides the appropriate URLs to use for container registry for this project"
}
