resource "aws_network_acl" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.public2_subnet.id]
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "terraform-public-subnet"
  }
}


resource "aws_network_acl" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.private_subnet.id,aws_subnet.private2_subnet.id]
  dynamic "egress"  {
    for_each = var.nacl_private_port
    iterator = port
    content {
    protocol   = "tcp"
    rule_no    = port.value.rule_no
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = port.value.from_port
    to_port    = try(port.value.to_port, port.value.from_port)
  }
}

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "terraform-private-subnet"
  }
}
