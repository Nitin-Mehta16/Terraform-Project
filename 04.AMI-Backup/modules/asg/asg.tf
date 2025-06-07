resource "aws_autoscaling_group" "Auto-Scaling-group-Template" {
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [var.private_subnet_id, var.private2_subnet_id]

  launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "terraform-ec2-template"
    value               = "asg-ec2-instance"
    propagate_at_launch = true
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true
}
