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
  tags = {
    Environment = "katana-env"
  }
}
