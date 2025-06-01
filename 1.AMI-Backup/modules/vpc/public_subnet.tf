resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.Public_CIDR_BLOCK
  availability_zone       = var.Public_Subnet_AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-public-subnet"
  }
}

resource "aws_subnet" "public2_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.Public2_CIDR_BLOCK
  availability_zone       = var.Public2_Subnet_AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-public2-subnet"
  }
}