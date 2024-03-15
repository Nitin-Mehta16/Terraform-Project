provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server1" {
  ami =  "ami-03bb6d83c60fc5f7c"
  instance_type = "t2.micro"
}