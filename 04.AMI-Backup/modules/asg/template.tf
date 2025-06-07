resource "aws_launch_template" "ec2_launch_template" {
  name_prefix   = "tf-asg-ec2-confg"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name = var.key_name

  network_interfaces {
    security_groups = [var.security_groups]
    associate_public_ip_address = false
  }
  lifecycle {
    create_before_destroy = true
  } 
  
}
