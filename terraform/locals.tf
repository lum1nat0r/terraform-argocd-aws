locals {
  name = "argocd-eks"
  region = "eu-central-1"
    cluster_name = "argocd-eks"
    cluster_version = "1.29"
    namespace = "argocd"

    # VPC
    vpc_cidr = "10.123.0.0/16"
    azs = ["eu-central-1a", "eu-central-1b"]

    # Subnets
    public_subnets = ["10.123.1.0/24", "10.123.2.0/24"]
    private_subnets = ["10.123.10.0/24", "10.123.11.0/24"]
    intra_subnets = ["10.123.50.0/24", "10.123.51.0/24"]
}