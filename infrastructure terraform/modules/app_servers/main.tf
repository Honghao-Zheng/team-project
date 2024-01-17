resource "aws_instance" "app_server" {
  count                       = 3
  vpc_security_group_ids      = [var.aws_security_group_egress, var.aws_security_group_ingress]
  ami                         = "ami-0505148b3591e4c07"
  instance_type               = "t2.micro"
  key_name                    = "project1key"
  subnet_id                   = var.public_subnets[count.index]
  associate_public_ip_address = true


  tags = {
    Name = "app_server_00${count.index}"
  }
}