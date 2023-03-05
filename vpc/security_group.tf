resource "aws_security_group" "web-security-group" {
  name        = "${var.title}-web-security-group"
  description = "security-group"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "${var.title}-web-security-group"
  }
}

resource "aws_security_group_rule" "security-group-role-ingress-SSH" {
  type        = "ingress"
  description = "security-group-role-ingress-SSH"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  security_group_id = aws_security_group.web-security-group.id
}

resource "aws_security_group_rule" "security-group-role-ingress-HTTP" {
  type        = "ingress"
  description = "security-group-role-ingress-HTTP"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  security_group_id = aws_security_group.web-security-group.id
}

resource "aws_security_group_rule" "security-group-role-egress-all" {
  type        = "egress"
  description = "security-group-role-egress-all"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  security_group_id = aws_security_group.web-security-group.id
}