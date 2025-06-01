variable "aws_region" {
  description = "The AWS region where the AMI backup will be performed."
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The type of instance to use for the bastion host."
  type        = string
  default     = "t2.micro"
}
variable "public_ec2_key" {
  description = "The public key to be used for the EC2 instance."
  type        = string
  default     = "./keys/ec2_id_rsa.pub" # Default path to the public key, can be overridden

}
variable "private_ec2_key" {
  description = "The private key to be used for the EC2 instance."
  type        = string
  default     = "./keys/ec2_id_rsa"
}
variable "public_bastion_key" {
  description = "The public key to be used for the EC2 instance."
  type        = string
  default     = "./keys/bastion_id_rsa.pub" # Default path to the public key, can be overridden  
}
variable "private_bastion_key" {
  description = "The private key to be used for the EC2 instance."
  type        = string
  default     = "./keys/bastion_id_rsa"
}
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "Public_CIDR_BLOCK" {
  description = "The CIDR block for the Public Subnet."
  type        = string
  default     = "10.0.0.0/28"
}
variable "Public2_CIDR_BLOCK" {
  description = "The CIDR block for the Public Subnet."
  type        = string
  default     = "10.0.16.0/28"
}

variable "Private_CIDR_BLOCK" {
  description = "The CIDR block for the Private subnet."
  type        = string
  default     = "10.0.1.0/24"
}
variable "Private2_CIDR_BLOCK" {
  description = "The CIDR block for the Public Subnet."
  type        = string
  default     = "10.0.25.0/28"
}

variable "Public_Subnet_AZ" {
  description = "The availability zone for the Public Subnet."
  type        = string
  default     = "ap-south-1a"
}
variable "Public2_Subnet_AZ" {
  description = "The availability zone for the Public Subnet."
  type        = string
  default     = "ap-south-1b"
}
variable "Private_Subnet_AZ" {
  description = "The availability zone for the Private Subnet."
  type        = string
  default     = "ap-south-1a"
}
variable "Private2_Subnet_AZ" {
  description = "The availability zone for the Private Subnet."
  type        = string
  default     = "ap-south-1b"
}
variable "startup_script" {
  description = "The startup script to run on the private EC2 instance."
  type        = string
  default     = "./startup.sh" # Default path to the startup script, can be overridden

}


variable "portfolio" {
  description = "The path to the portfolio files to be copied to the private EC2 instance."
  type        = string
  default     = "./portfolio"
}

variable "pub_port" {
  description = "security group ports for public sever(bastion)"
  type        = any
}

variable "nacl_private_port" {
  description = "nacl ports for private subnet"
  type        = any
}


