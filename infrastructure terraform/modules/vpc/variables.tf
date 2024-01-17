variable "public_cidr_ranges" {
    type = list(string)
    default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidr_ranges" {
    type = list(string)
    default = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
}

variable "availability_zones" {
    type = list(string)
    default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}