resource "aws_nat_gateway" "nat-gateway" {
  connectivity_type = "public"
  allocation_id     = aws_eip.elastic-ip-natgateway.id
  subnet_id         = aws_subnet.public-subnet-1a.id

  tags = {
    Name = "${var.title}-NATGateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet-gateway]
}