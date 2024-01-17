variable "aws_security_group_egress" {
    type = string
}

variable "aws_security_group_ingress" {
    type = string
}

variable "aws_security_group_app_server" {
    type = string
}

variable "public_subnets" { 
    type = list(string)
}
