variable "public_subnets" { 
    type = list(string)
}

variable "rds_security_group" {
  type = list(string)
}

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