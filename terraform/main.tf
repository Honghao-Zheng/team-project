
module "networking" {
  source = "./modules/networking"

  vpc_name     = "eks-temp"
  cluster_name = "eks-temp"
}

# Provision cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.2"

  cluster_name    = "eks-temp"
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
      min_size     = 2
      max_size     = 5
      desired_size = 3
    }
    
  }
}