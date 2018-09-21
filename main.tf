data "vault_generic_secret" "gcp" {
    path = "${var.vault_gcp_credentials_path}"
}

provider "google" {
  credentials = "${data.vault_generic_secret.gcp.data["json"]}"
  project     = "${data.vault_generic_secret.gcp.data["project_id"]}"
  region      = "${var.cluster_zone}"
}

resource "random_string" "username" {
  length  = 16
  special = false
  number  = true
  lower   = true
  upper   = true
}

resource "random_string" "password" {
  length  = 16
  special = true
  number  = true
  lower   = true
  upper   = true
}


module "gke-cluster" {
  source = "google-terraform-modules/kubernetes-engine/google"
  version = "1.17.0"

  general = {
    name = "${var.cluster_name}"
    env  = "${var.cluster_env}"
    zone = "${var.cluster_zone}"
  }

  master = {
    username = "${random_string.username.result}"
    password = "${random_string.password.result}"
  }

  default_node_pool = {
    node_count = 3
    remove     = false
  }

  # Optional in case we have a default pool
  node_pool = [
    {
      machine_type   = "g1-small"
      disk_size_gb   = 20
      node_count     = 3
      min_node_count = 2
      max_node_count = 4
    },
    {
      disk_size_gb   = 30
      node_count     = 2
      min_node_count = 1
      max_node_count = 3
    },
  ]
}