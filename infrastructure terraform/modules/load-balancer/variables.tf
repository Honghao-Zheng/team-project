variable "vpc_id" {
    type = string
}

variable "aws_security_group_ingress" {
    type = string
}

variable "public_subnets" {
    type = list(string)
}

variable "aws_instance_app_server" {
    type = list(string)
}