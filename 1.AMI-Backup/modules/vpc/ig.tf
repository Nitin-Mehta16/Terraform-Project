resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "terraform-internet-gateway"
  }
}



