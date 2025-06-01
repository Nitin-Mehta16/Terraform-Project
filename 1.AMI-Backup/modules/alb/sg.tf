resource "aws_security_group" "tf-lb-sg" {
  name        = "terraform-load_balancer-sg"
  description = "security group of load balancer "
  vpc_id      = var.vpc_id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
}
  tags = {
    Name = "terraform-load_balancer-sg"
  }
}

