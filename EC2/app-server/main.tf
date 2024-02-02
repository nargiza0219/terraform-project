resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "public" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = var.subnet_id
  availability_zone = "${var.region}a"
  associate_public_ip_address = true
  user_data = file("nginx.sh")
  tags = {
    Name = "my-public-instance"
  }
}
