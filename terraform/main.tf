# module "vpc" {
#     source = "./modules/vpc"
    
# }

module "security" {
    source = "./modules/security"
    vpc_id = module.networking.vpc_id
}

# module "load-balancer" {
#     source = "./modules/load-balancer"
#     vpc_id = module.vpc.vpc_id
#     aws_security_group_ingress = module.security.aws_security_group_ingress
#     public_subnets = module.vpc.public_subnets
#     aws_instance_app_server = module.app_servers.aws_instance_app_server
# }

# module "app_servers" {
#     source ="./modules/app_servers"
#      aws_security_group_egress = module.security.aws_security_group_egress
#      aws_security_group_ingress = module.security.aws_security_group_ingress
#      public_subnets = module.vpc.public_subnets
#      aws_security_group_app_server = module.security.aws_security_group_app_server
# }

module "ecr" {
  source           = "./modules/ecr"
  ecr_name         = var.ecr_name
  tags             = var.tags
  image_mutability = var.image_mutability
}

module "rds" {
  source           = "./modules/rds"
  public_subnets = module.networking.public_subnets

}

# For eks cluster
# Provision the VPC network
module "networking" {
    source          = "./modules/networking"

    vpc_name        = var.vpc_name
    cluster_name    = var.cluster_name
}

# Provision cluster
module "eks_cluster" {
    source  = "terraform-aws-modules/eks/aws"
  version = "19.15.2"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  vpc_id                         = module.networking.vpc_id
  subnet_ids                     = module.networking.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  # For cost management purposes
  # a single node group, with a 
  # single node within the group
  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }
}