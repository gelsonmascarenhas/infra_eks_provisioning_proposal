resource "aws_eks_cluster" "118-cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.118-cluster-role.arn

  vpc_config {
    security_group_ids = [aws_security_group.118-cluster-group.id]
    subnet_ids = module.vpc.public_subnets
  }

  depends_on = [
    aws_iam_role_policy_attachment.118-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.118-cluster-AmazonEKSServicePolicy,
  ]
}

