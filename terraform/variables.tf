variable "ecr_name" {
  description = "The list of ecr names to create"
  type        = list(string)
  default     = null
}
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}
variable "image_mutability" {
  description = "Provide image mutability"
  type        = string
  default     = "MUTABLE"
}

variable "encrypt_type" {
  description = "Provide type of encryption here"
  type        = string
  default     = "KMS"
}

# for eks cluster
variable "vpc_name" {
  description = "Name of the VPC to place cluster in"
  type        = string
  default     = "eks-vpc"
}

variable "cluster_name" {
  description = "Name you wish to give to your EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

//testing


# variable "vpc_id" {
#   description = "The ID of the VPC to place the cluster id"
#   type        = string
# }

# variable "private_subnets" {
#   description = "Private Subnet IDs for the cluster"
#   type        = list(string)
# }


variable "engine" {
  type = string
}

variable "identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}
variable "availability_zone" {
  type = string
}