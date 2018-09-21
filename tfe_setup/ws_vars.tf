variable "cluster_name" {
    type="string"
}
resource "tfe_variable" "cluster_name" {
    key = "cluster_name"
    value = "${var.cluster_name}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "cluster_env" {
    type="string"
}
resource "tfe_variable" "cluster_env" {
    key = "cluster_env"
    value = "${var.cluster_env}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "cluster_zone" {
    type="string"
}
resource "tfe_variable" "cluster_zone" {
    key = "cluster_zone"
    value = "${var.cluster_zone}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}