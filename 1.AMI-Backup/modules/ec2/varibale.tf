variable "instance_type" {
  description = "The type of instance to use for the bastion host."
  type        = string
}
variable "public_ec2_key" {
  description = "The public key to be used for the EC2 instance."
  type        = string  
}
variable "private_ec2_key" {
  description = "The private key to be used for the EC2 instance."
  type        = string  
}

variable "public_bastion_key" {
  description = "The public key for the bastion host."
  type        = string
}



variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be launched."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where the EC2 instance will be launched."
  type        = string
}
variable "public2_subnet_id" {
  description = "The ID of the public subnet where the EC2 instance will be launched."
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet where the EC2 instance will be launched."
  type        = string

}

variable "private2_subnet_id" {
  description = "The ID of the private subnet where the EC2 instance will be launched."
  type        = string

}

variable "private_bastion_key" {
  description = "The private key to be used for the EC2 instance."
  type        = string
}

variable "startup_script" {
  description = "The startup script to run on the private EC2 instance."
  type        = string  
}

variable "portfolio" {
  description = "The path to the portfolio files to be copied to the private EC2 instance."
  type        = string
}

variable "pub_port" {
  description = "security group ports for public sever(bastion)"
  type = any  
}

variable "lb-sg" {
  description = "sg of load balancer"
  type =  any
}