#!/bin/bash
sudo apt update
<<EOF
echo "hello, nitin" > index.html
nohup busybox httpd -f -p ${var.port_for_sg} &
EOF

