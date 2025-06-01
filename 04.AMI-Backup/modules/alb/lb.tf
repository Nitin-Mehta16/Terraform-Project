resource "aws_lb" "tf-alb" {
  name               = "tf-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tf-lb-sg.id]
  subnets            = [var.public_subnet, var.public2_subnet]
  

  enable_deletion_protection = false

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    Name = "tf-lb"
  }
}

resource "aws_lb_listener" "portfolio_live" {
  load_balancer_arn = aws_lb.tf-alb.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf-lb_target_group.arn
  }
}