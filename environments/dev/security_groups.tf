resource "aws_security_group" "eks_node_sg" {
  name        = "eks-node-sg"
  description = "Zero Trust SG for nodes"
  vpc_id      = module.vpc.vpc_id

  egress = []
  ingress = []

  tags = {
    Name = "eks-node-ZT"
  }
# TODO: expand only with least-privilege rules
}
