# infrastructure/vpc.tf
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "insight-pulse-vpc"
  cidr = "10.0.0.0/16"

  # We use 2 Availability Zones for high availability
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true # Allows private nodes to reach the internet for updates/API calls
  single_nat_gateway = true # Cost-effective for small clusters

  tags = {
    Environment = "production"
    Project     = "insight-pulse"
  }
}