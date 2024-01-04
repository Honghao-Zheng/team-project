output "aws_security_group_ingress" {
    value = aws_security_group.ingress_control.id
}

output "aws_security_group_egress" {
    value = aws_security_group.egress_control.id
}

output "aws_security_group_app_server" {
    value = aws_security_group.app_server.id
}