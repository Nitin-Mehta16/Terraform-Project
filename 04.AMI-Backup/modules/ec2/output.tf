
output "subnet_id" {
  value = aws_instance.bastion_host.subnet_id
}
output "bastion_host_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "ec2_private_ips" {
  description = "Private IPs of EC2 instances in the private subnet"
  value       = [for instance in aws_instance.ec2_private : instance.private_ip]
}
output "private_instance_id" {
  value = [for instance in aws_instance.ec2_private : instance.id]
}
output "private2_instance_id" {
  value = aws_instance.ec2_private2.id
}
output "bastion_key_name" {
  value = aws_key_pair.Tf-bastion_key.key_name
}

output "ec2_key_name" {
  value = aws_key_pair.Tf-pvt-ec2_key.key_name
}

output "tf-sg-public_id" {
  value = aws_security_group.tf-sg-public.id
}
output "tf-sg-private_id" {
  value = aws_security_group.tf-sg-private.id
}

output "public_security_group_id" {
  value = aws_security_group.tf-sg-public.id
}
output "private_security_group_id" {
  value = aws_security_group.tf-sg-private.id
}

output "ami-id" {
  value = aws_ami_from_instance.ami-backup.id 
}

output "ubuntu-ami-id" {
  value = data.aws_ami.ubuntu.id
}

output "sg" {
  value = aws_security_group.tf-sg-public.id
}

output "key-name" {
  value = aws_key_pair.Tf-pvt-ec2_key.key_name
}
