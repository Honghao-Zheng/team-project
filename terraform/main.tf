module "vpc" {
    source = "./modules/vpc"
}

module "security" {
    source = "./modules/security"
    vpc_id = module.vpc.vpc_id
}

module "load-balancer" {
    source = "./modules/load-balancer"
    vpc_id = module.vpc.vpc_id
    aws_security_group_ingress = module.security.aws_security_group_ingress
    public_subnets = module.vpc.public_subnets
    aws_instance_app_server = module.app_servers.aws_instance_app_server
}

module "app_servers" {
    source ="./modules/app_servers"
     aws_security_group_egress = module.security.aws_security_group_egress
     aws_security_group_ingress = module.security.aws_security_group_ingress
     public_subnets = module.vpc.public_subnets
     aws_security_group_app_server = module.security.aws_security_group_app_server
}
