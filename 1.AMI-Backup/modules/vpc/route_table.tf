resource "aws_route_table" "public_terraform_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "pub-rt-assoc-pub-subnet-1" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_terraform_rt.id
}

resource "aws_route_table_association" "pub-rt-assoc-pub-subnet-2" {
  subnet_id      = aws_subnet.public2_subnet.id
  route_table_id = aws_route_table.public_terraform_rt.id
}




resource "aws_route_table" "private_terraform_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private-route-table"
  }
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-NAT-public1.id
  }
}

resource "aws_route_table_association" "pvt-rt-assoc-pvt-subnet" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_terraform_rt.id
}


resource "aws_route_table" "private2_terraform_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private2-route-table"
  }
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-NAT-public2.id
  }
}

resource "aws_route_table_association" "pvt2-rt-assoc-pvt-subnet" {
  subnet_id      = aws_subnet.private2_subnet.id
  route_table_id = aws_route_table.private2_terraform_rt.id
}
