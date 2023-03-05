resource "aws_eip" "elastic-ip" {
  instance = aws_instance.web.id
  vpc      = true
  tags = {
    Name = "${var.title}-EC2-DB"
  }

}