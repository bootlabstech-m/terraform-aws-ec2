
variable "instance_details" {
  description = "instance_details"
  type        =  list(object({
    ami            = string
    instance_type  = string
    volume_size    = number
    instance_name  = string
  }))
}
/*
variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "volume_size" {
  description = "Whether to create an instance Size of the root volume in gigabytes"
  type        = number
}

variable "instance_name" {
  description = "Name to be used on EC2 instance created"
  type        = string
}*/
variable "name_prefix" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
  type        = string
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
  type        = string
}

variable "region" {
  description = "AWS Region the instance is launched in"
  type        = string
}
variable "subnet_id" {
  description = "VPC Subnet ID to launch in"
  type        = string
}

variable "security_groups" {
  description = "VPC security group for your instance."
  type        = list(string)
}
variable "role_arn" {
  description = " The ARN of the IAM role"
 type = string
}