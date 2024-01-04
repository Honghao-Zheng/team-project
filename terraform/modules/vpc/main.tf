resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "team-project-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_cidr_ranges)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_cidr_ranges[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "team-project-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_cidr_ranges)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_cidr_ranges[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "team-project-private-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "team-project-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "team-project-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.availability_zones)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route" "igw" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}