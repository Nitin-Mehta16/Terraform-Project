variable "vpc_id" {
    type = string
}
variable "public_subnet" {
  type = any
}
variable "public2_subnet" {
  type = any
}
variable "private_instance_id" {
  type = list(string)
}
variable "private2_instance_id" {
  type = string
}

