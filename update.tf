data "external" "date" {
  program = "${var.timestamp_cmd}"
}

resource "null_resource" "force_update" {
  provisioner "local-exec" {
      command = "echo ${data.exter.date.result}"
  }
}
