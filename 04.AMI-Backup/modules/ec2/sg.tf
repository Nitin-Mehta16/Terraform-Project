resource "aws_security_group" "tf-sg-public" {
  name        = "terraform-sg"
  description = "Allow ssh into public subnet"
  vpc_id      = var.vpc_id

  dynamic "ingress" { 
    for_each = var.pub_port 
    iterator = port
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your IP or a more restrictive CIDR block
  }
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
}
  tags = {
    Name = "terraform-sg-public"
  }
}




resource "aws_security_group" "tf-sg-private" {
  name        = "terraform-sg-private"
  description = "Allow ssh into private subnet"
  vpc_id      = var.vpc_id
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.tf-sg-public.id] # Allow SSH access from the bastion host
  }
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.lb-sg] # Allow SSH access from the bastion host
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
}
  tags = {
    Name = "terraform-sg-private"
  }
}

