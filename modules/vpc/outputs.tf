output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnets" {
    value = aws_subnet.public_subnets[*].id
}

output "private_subnets" {
    value = aws_subnet.private_subnets[*].id
}

output "route_table" {
    value = aws_route_table.public_route_table.id
}