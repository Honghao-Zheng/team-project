output "aws_instance_app_server" {
    value = aws_instance.app_server[*].id
}