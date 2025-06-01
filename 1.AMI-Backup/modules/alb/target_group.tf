resource "aws_lb_target_group" "tf-lb_target_group" {
  name     = "tf-lb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tf-lb_target_group_attachment" {
  count            = length(var.private_instance_id)
  target_group_arn = aws_lb_target_group.tf-lb_target_group.arn
  target_id        = var.private_instance_id[count.index]
  port             = 80
}

resource "aws_lb_target_group_attachment" "tf-lb_target2_group_attachment" {
  target_group_arn = aws_lb_target_group.tf-lb_target_group.arn
  target_id        = var.private2_instance_id
  port             = 80
}