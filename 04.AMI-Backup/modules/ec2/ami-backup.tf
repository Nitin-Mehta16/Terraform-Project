resource "aws_ami_from_instance" "ami-backup" {
  name               = "terraform-ami-backup"
  source_instance_id = aws_instance.ec2_private2.id
  snapshot_without_reboot = true
}