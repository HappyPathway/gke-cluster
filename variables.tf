variable "cluster_zone" {
    

}

variable "additional_zones" {
    type = "list"
    default = [
        "us-east1-c",
        "us-east1-d",
    ]
    description = "List of GCP Additional Zones for K8s Cluster"
}
variable "cluster_env" {
  
}

variable "cluster_name" {

}


variable "vault_gcp_credentials_path" {
    default = "secret/credentials/gcp"
}