variable "instance_type" {
  description = "The type of instance to use for the bastion host."
  type        = string
}
variable "public_ec2_key" {
  description = "The public key to be used for the EC2 instance."
  type        = string  
}
variable "public_bastion_key" {
  description = "The public key for the bastion host."
  type        = string
}
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}
variable "Public_CIDR_BLOCK" {
  description = "The CIDR block for the Public Subnet."
  type        = string
}
variable "Public2_CIDR_BLOCK" {
  description = "The CIDR block for the Public Subnet."
  type        = string
}

variable "Private_CIDR_BLOCK" {
  description = "The CIDR block for the Private subnet."
  type        = string
}
variable "Private2_CIDR_BLOCK" {
  description = "The CIDR block for the Public Subnet."
  type        = string

}

variable "Public_Subnet_AZ" {
  description = "The availability zone for the Public Subnet."
  type        = string
}
variable "Public2_Subnet_AZ" {
  description = "The availability zone for the Public Subnet."
  type        = string
}
variable "Private_Subnet_AZ" {
  description = "The availability zone for the Private Subnet."
  type        = string
}
variable "Private2_Subnet_AZ" {
  description = "The availability zone for the Private Subnet."
  type        = string
}

variable "nacl_private_port" {
  description = "nacl ports for private subnet"
  type = any
}

