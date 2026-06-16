# infrastructure/eks.tf
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "insight-pulse-cluster"
  cluster_version = "1.31"

  # Link this to the VPC we created in vpc.tf
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Managed Node Groups: These are your EC2 instances
  eks_managed_node_groups = {
    production = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.micro"] # Balanced cost/performance
    }
  }
  # Enable public access so your laptop can reach the cluster
  cluster_endpoint_public_access = true
  cluster_endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true
}