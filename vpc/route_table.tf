resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "${var.title}-route-table-public"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.route-table-public.id
}
