output "internet_gateway_id" {
  value = aws_internet_gateway.terraform_igw.id
}


output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
output "private2_subnet_id" {
  value = aws_subnet.private2_subnet.id
}

output "private_subnet_cidr" {
  value = aws_subnet.private_subnet.cidr_block
  
}


output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
output "public2_subnet_id" {
  value = aws_subnet.public2_subnet.id
}
output "public_subnet_cidr" {
  value = aws_subnet.public_subnet.cidr_block
  
}


output "public_route_table_id" {
  value = aws_route_table.public_terraform_rt.id
}
output "private_route_table_id" {
  value = aws_route_table.private_terraform_rt.id
}




output "vpc_id" {
  value = aws_vpc.vpc.id
}

