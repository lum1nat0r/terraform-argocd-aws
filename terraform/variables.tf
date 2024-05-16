variable "name" {
  description = "Name of the VPC"
}

variable "region" {
  description = "Region where the VPC will be created"
}

variable "environment" {
  description = "Environment where the VPC will be created"
  default = "dev"
  
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets"
  type = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for the private subnets"
  type = list(string)
}

variable "azs" {
  description = "Availability Zones where the VPC will be created"
  type = list(string)
}

variable "tags" {
  description = "Tags to apply to all resources"
  type = map(string)
}

variable "cluster_name" {
  description = "EKS cluster name"
  default = "eks-cluster"
}

variable "cluster_version" {
  description = "EKS cluster version"
  default = "1.29"
}