resource "aws_vpc" "vpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr2
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block =  "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "subnet_association1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "subnet_association2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "sg" {
  name   = "sg"
  vpc_id = aws_vpc.vpc.id

 ingress { 
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

 ingress {
   description = "SSH"
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks =  ["0.0.0.0/0"]
  }
 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks =  ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "server1" {
  ami = "ami-03bb6d83c60fc5f7c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.subnet_1.id
}

resource "aws_instance" "server2" {
  ami = "ami-03bb6d83c60fc5f7c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.subnet_2.id

}

resource "aws_s3_bucket" "bucket" {
  bucket = "nitinbucketvpc"
}


resource "aws_lb" "mylb" {
  name = "mylb"
  internal = false
  load_balancer_type =  "application"
  security_groups = [aws_security_group.sg.id]
  subnets = [aws_subnet.subnet_1.id,aws_subnet.subnet_2.id]

  tags = {
    Name = "lb"
  }
  
}

resource "aws_lb_target_group" "tg" {
  name = "TG"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc.id

}
  
