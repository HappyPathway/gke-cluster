variable "cluster_zone" {
    

}

variable "timestamp_cmd" {
    type = "list"
    description = "Command for timestamp"
    default = ["date", 
               "+%s", 
               "|", 
               "/usr/bin/env", 
               "python2.7", 
               "-c", 
               "import sys, json; print json.dumps(dict(timestamp=sys.stdin.read().strip()))"] 
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