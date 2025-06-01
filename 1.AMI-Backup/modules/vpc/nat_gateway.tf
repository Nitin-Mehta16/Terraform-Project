resource "aws_nat_gateway" "terraform-NAT-public1" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "terraform-NAT_gateway-public1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.terraform_igw]
}

resource "aws_nat_gateway" "terraform-NAT-public2" {
  allocation_id = aws_eip.eip-nat2.id
  subnet_id     = aws_subnet.public2_subnet.id

  tags = {
    Name = "terraform-NAT_gateway-public2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.terraform_igw]
}