data "vault_generic_secret" "gcp" {
    path = "${var.vault_gcp_credentials_path}"
}

module "force_update" {
  source = "github.com/HappyPathway/terraform-null-update"
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


resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}"
  zone               = "${var.cluster_zone}"
  initial_node_count = 3

  additional_zones = "${var.additional_zones}"

  master_auth {
    username = "${random_string.username.result}"
    password = "${random_string.password.result}"
    client_certificate_config {
      issue_client_certificate = true
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    
  }
}

 