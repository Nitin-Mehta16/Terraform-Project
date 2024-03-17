provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "sg" {
    name = "terraform_sg"
    ingress = {
        from_port = var.port_for_sg
        to_port = var.port_for_sg
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "server" {
  ami = "ami-03bb6d83c60fc5f7c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = base64encode(file("data.sh"))

  tags = {
    name = "terraform_webserver"
  }

}



