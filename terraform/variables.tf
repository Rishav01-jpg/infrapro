variable "aws_region" {
  description = "AWS region where InfraPro resources will be created"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the developer VM"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the developer subnet"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the InfraPro VPC"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair used for the developer VM"
  type        = string
}

variable "public_key_path" {
  description = "Path to the SSH public key used for the developer VM"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}
