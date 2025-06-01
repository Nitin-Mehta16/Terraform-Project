
resource "aws_key_pair" "Tf-bastion_key" {
  key_name   = "Tf-bastion-key"
  public_key = file(var.public_bastion_key) # Replace with the path to your public key

}

resource "aws_key_pair" "Tf-pvt-ec2_key" {
  key_name   = "Tf-pvt-ec2-key"
  public_key = file(var.public_ec2_key) # Replace with the path to your public key

}

