resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.Private_CIDR_BLOCK
  availability_zone = var.Private_Subnet_AZ

  tags = {
    Name = "terraform-private-subnet"
  }
}

resource "aws_subnet" "private2_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.Private2_CIDR_BLOCK
  availability_zone = var.Private2_Subnet_AZ

  tags = {
    Name = "terraform-private2-subnet"
  }
}

