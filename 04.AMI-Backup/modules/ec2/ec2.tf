resource "aws_instance" "bastion_host" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.tf-sg-public.id ]
  key_name                    = aws_key_pair.Tf-bastion_key.key_name
  tags = {
    Name = "terraform-bastion_host"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_bastion_key)
    host        = self.public_ip
  }
}

resource "aws_instance" "bastion_host2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.public2_subnet_id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.tf-sg-public.id ]
  key_name                    = aws_key_pair.Tf-bastion_key.key_name
  tags = {
    Name = "terraform-bastion_host"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_bastion_key)
    host        = self.public_ip
  }
}



resource "aws_instance" "ec2_private" {
  count = 1
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = var.private_subnet_id
  security_groups = [aws_security_group.tf-sg-private.id]
  associate_public_ip_address = false
  key_name        = aws_key_pair.Tf-pvt-ec2_key.key_name

  tags = {
    Name = "tf-ec2-private-${count.index}"
  }
  depends_on = [aws_instance.bastion_host] 
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_ec2_key)
    host        = self.private_ip
    bastion_user        = "ubuntu"
    bastion_host = aws_instance.bastion_host.public_ip
    bastion_private_key = file(var.private_bastion_key)
  }
 

  provisioner "file" {
    source      = var.startup_script
    destination = "/home/ubuntu/startup_script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/startup_script.sh",
      "bash /home/ubuntu/startup_script.sh"
    ]
  }

  provisioner "file" {
    source      = var.portfolio
    destination = "/var/www/html"
  }


}


resource "aws_instance" "ec2_private2" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = var.private2_subnet_id
  security_groups = [aws_security_group.tf-sg-private.id]
  associate_public_ip_address = false
  key_name        = aws_key_pair.Tf-pvt-ec2_key.key_name

  tags = {
    Name = "tf-ec2-private-2"
  }
  depends_on = [aws_instance.bastion_host] 
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_ec2_key)
    host        = self.private_ip
    bastion_user        = "ubuntu"
    bastion_host = aws_instance.bastion_host.public_ip
    bastion_private_key = file(var.private_bastion_key)
  }
 

  provisioner "file" {
    source      = var.startup_script
    destination = "/home/ubuntu/startup_script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/startup_script.sh",
      "bash /home/ubuntu/startup_script.sh"
    ]
  }

  provisioner "file" {
    source      = var.portfolio
    destination = "/var/www/html"
  }


}

