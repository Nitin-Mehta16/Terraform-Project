resource "aws_eip" "eip-nat" {
  domain   = "vpc"
  depends_on                = [aws_internet_gateway.terraform_igw]
}

resource "aws_eip" "eip-nat2" {
  domain   = "vpc"
  depends_on                = [aws_internet_gateway.terraform_igw]
}