terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.49.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.30.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.13.2"
    }
  }

#   backend "s3" {
#     bucket = "argocd-eu-central-1"
#     key    = "argocd/eu-central-1/terraform.tfstate"
#     region = "eu-central-1"
#     # encrypt = true
#   }
}