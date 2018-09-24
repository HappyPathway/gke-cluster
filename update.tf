resource "null_resource" "timestamp" {
  provisioner "local-exec" {
      command = "date +%s | /usr/bin/env python2.7 -c 'import sys, json; print json.dumps(dict(timestamp=sys.stdin.read().strip()))' > /tmp/date.json" 
  }
}

data "external" "json_date" {
    depends_on = [
        "null_resource.timestamp"
    ]
    program = ["cat", "/tmp/date.json"]
}

resource "null_resource" "force_update" {
  provisioner "local-exec" {
      command = "echo ${data.external.json_date.result}"
  }
}
