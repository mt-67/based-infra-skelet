module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"
 
  cluster_name    = "skeleton"
  cluster_version = "1.32"

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  endpoint_private_access = true
  endpoint_public_access  = false

  eks_managed_node_groups = {} 

  tags = {
    Environment = "skeleton-env"
  }
}