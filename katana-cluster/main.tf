module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway   = var.enable_nat
  single_nat_gateway   = true
  one_nat_gateway_per_az = false

  tags = {
    Project = "katana"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"
 
  cluster_name    = "katana"
  cluster_version = "1.32"

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  endpoint_private_access = true
  endpoint_public_access  = false

  eks_managed_node_groups = {
    default = {
      instance_types   = ["t3.medium"] # allows you to temporarily increase CPU performance
      min_size         = 0
      max_size         = 8
      desired_size     = 0 # TODO: scale up when first microservice is deployed
    }
  }

  tags = {
    Environment = "katana-env"
  }
}

resource "aws_cloudwatch_log_group" "vpc_logs" {
  name              = "/vpc/flow-logs"
  retention_in_days = 30

  tags = {
    Name = "VPC Flow Logs"
  }
}
