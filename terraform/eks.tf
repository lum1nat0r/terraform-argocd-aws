module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.10.0"

  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  # Enable EFA support by adding necessary security group rules
  # to the shared node security group
  enable_efa_support = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent    = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
    instance_types = ["t2.micro", "t3.micro"]

    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    # Default node group - as provided by AWS EKS
    example_group = {
        use_custom_launch_template = false

        min_size = 1
        max_size = 2
        desired_size = 1

        instance_types = ["t2.micro"]
        capacity_type = "SPOT"

        disk_size = 20
    }
  }

  tags = var.tags
}