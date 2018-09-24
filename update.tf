resource "null_resource" "timestamp" {
  provisioner "local-exec" {
      command = "date +%s | /usr/bin/env python2.7 -c 'import sys, json; print json.dumps(dict(timestamp=sys.stdin.read().strip()))' > /tmp/date.json" 
  }
}
