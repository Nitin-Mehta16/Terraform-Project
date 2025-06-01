aws_region          = "ap-south-1"
instance_type       = "t2.micro"
public_ec2_key      = "./keys/ec2_id_rsa.pub" # Path to the public key for EC2 instance
private_ec2_key     = "./keys/ec2_id_rsa"
public_bastion_key  = "./keys/bastion_id_rsa.pub" # Path to the public key for Bastion host
private_bastion_key = "./keys/bastion_id_rsa"
vpc_cidr_block      = "10.0.0.0/16"
Public_CIDR_BLOCK   = "10.0.0.0/28"
Private_CIDR_BLOCK  = "10.0.1.0/24"
Public_Subnet_AZ    = "ap-south-1a"
Private_Subnet_AZ   = "ap-south-1a"
portfolio           = "./portfolio/"
startup_script      = "./startup.sh"
pub_port            = [22, 80, 443]
nacl_private_port = [
  { from_port = 443, rule_no = 3 },
  { from_port = 1024, to_port = 65535, rule_no = 4 },
{ from_port = 80, rule_no = 5 }]