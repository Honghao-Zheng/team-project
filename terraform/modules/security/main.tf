resource "aws_security_group" "ingress_control" {
  vpc_id = var.vpc_id

  tags = {
    Name = "project-security-group-ingress"
  }
}

resource "aws_security_group" "egress_control" {
  vpc_id = var.vpc_id

  tags = {
    Name = "project-security-group-egress"
  }
}

resource "aws_security_group_rule" "allow_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ingress_control.id
}

resource "aws_security_group_rule" "allow_https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ingress_control.id
}

resource "aws_security_group_rule" "allow_ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 28
  protocol          = "tcp"
  cidr_blocks       = ["143.159.0.0/16"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ingress_control.id
}

resource "aws_security_group_rule" "allow_3000_ingress" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ingress_control.id
}

resource "aws_security_group_rule" "allow_http_egress" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.egress_control.id
}

resource "aws_security_group_rule" "allow_https_egress" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.egress_control.id
}

# resource "aws_security_group_rule" "allow_ssh_egress" {
#   type              = "egress"
#   from_port         = 22
#   to_port           = 28
#   protocol          = "tcp"
#   cidr_blocks       = ["143.159.0.0/16"]
#   ipv6_cidr_blocks  = ["::/0"]
#   security_group_id = aws_security_group.egress_control.id
# }

# resource "aws_security_group_rule" "allow_3000_egress" {
#   type              = "egress"
#   from_port         = 3000
#   to_port           = 3000
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = ["::/0"]
#   security_group_id = aws_security_group.egress_control.id
# }


resource "aws_security_group" "app_server" {
  name        = "app_server"
  description = "Security group for app servers"
  vpc_id      = var.vpc_id
}

resource "aws_security_group" "rds-security" {
  name        = "rds-security"
  description = "Security group for rds database"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "rds-inboud-rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ingress_control.id
}
