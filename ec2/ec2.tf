resource "aws_instance" "web" {
  ami                         = "ami-0329eac6c5240c99d"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet-1a.id
  associate_public_ip_address = true
  key_name                    = "key"
  vpc_security_group_ids      = [aws_security_group.web-security-group.id]

  tags = {
    Name = "${var.title}-EC2-Web"
  }
}


# -----------------

resource "aws_instance" "db" {
  ami                         = "ami-0329eac6c5240c99d"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private-subnet-1a.id
  associate_public_ip_address = false
  key_name                    = "key"
  vpc_security_group_ids      = [aws_security_group.db-security-group.id]

  tags = {
    Name = "${var.title}-EC2-DB"
  }
}