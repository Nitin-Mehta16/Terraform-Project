output "subnet_id" {
  value = module.ec2.subnet_id
}
output "bastion_host_public_ip" {
  value = module.ec2.bastion_host_public_ip
}
output "ec2_private__ip" {
  value = [module.ec2.ec2_private_ips]
}

output "private_instance_id" {
  value = module.ec2.private_instance_id
}
output "bastion_key_name" {
  value = module.ec2.bastion_key_name
}

output "ec2_key_name" {
  value = module.ec2.ec2_key_name
}



output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id

}


output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}
output "private_subnet_cidr" {
  value = module.vpc.private_subnet_cidr

}


output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}
output "public_subnet_cidr" {
  value = module.vpc.public_subnet_cidr

}


output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}
output "private_route_table_id" {
  value = module.vpc.private_route_table_id
}


output "public_security_group_id" {
  value = module.ec2.public_security_group_id
}
output "private_security_group_id" {
  value = module.ec2.private_security_group_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "tf-sg-public_id" {
  value = module.ec2.tf-sg-public_id
}
output "tf-sg-private_id" {
  value = module.ec2.tf-sg-private_id
}



output "lb" {
  value = module.alb.lb
}
output "lb-sg" {
   value=module.alb.lb-sg
}
output "lb-tg" {
  value = module.alb.lb-tg
}
output "lb-tg-ec2" {
  value = module.alb.lb-tg-ec2
}
output "lb-dns_name" {
  value = module.alb.lb-dns_name
}

output "ami-id" {
  value = module.ec2.ami-id 
}