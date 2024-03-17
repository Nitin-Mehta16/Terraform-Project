output "public_ip" {
  description = "give public ip address of EC2"
  value = aws_instance.server.public_ip
}