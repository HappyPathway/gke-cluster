variable "timestamp_cmd" {
    type = "list"
    description = "Command for timestamp"
    default = ["date", 
               "|", 
               "/usr/bin/env", 
               "python2.7", 
               "-c", 
               "import sys, json; print json.dumps(dict(timestamp=sys.stdin.read().strip()))"] 
}

data "external" "date" {
  program = "${var.timestamp_cmd}"
}

resource "null_resource" "force_update" {
  provisioner "local-exec" {
      command = "echo ${data.external.date.result}"
  }
}
