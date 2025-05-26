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
<<<<<<< HEAD

  tags = {
    Project = "skeleton"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"
 
  cluster_name    = "skeleton"
  cluster_version = "1.32"

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  eks_managed_node_groups = {} 

  tags = {
    Environment = "skeleton-env"
=======

  tags = {
    Project = "skeleton"
>>>>>>> 332e263bdae02348e1d7960b36ed408c75673cbf
  }
}