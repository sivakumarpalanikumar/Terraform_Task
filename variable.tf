variable "aws_access_key" {
default = ""
}
variable "aws_secret_key" {
default = ""
 }
variable "region" {
    default = ""
}

variable "vpc-cidr" {
  default     = "4.7.0.0/16"
  description = "VPC CIDR BLOCK"
  type        = string
}
variable "Public_Subnet_1" {
  default     = "4.0.1.0/24"
  description = "Public_Subnet_1"
  type        = string
}
variable "Private_Subnet_1" {
  default     = "4.0.0.0/24"
  description = "Private_Subnet_1"
  type        = string
}
variable "ssh-location" {
  default     = "0.0.0.0/0"
  description = "SSH variable for bastion host"
  type        = string
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  default = "LL-TEST"
  type    = string
}

variable "bucket_name" {

}

variable "cidr_ab" {
    type = map
    default = {
        development     = "172.22"
        qa              = "172.24"
        staging         = "172.26"
        production      = "4.7"
    }
}

locals {
    private_subnets         = [
        "${lookup(var.cidr_ab, var.environment)}.1.0/24",
       
        
    ]

    

    public_subnets          = [
        "${lookup(var.cidr_ab, var.environment)}.1.0/24",
        
        
    ]
}

variable "environment" {
    type = string
    description = "Options: development, qa, staging, production"
}
