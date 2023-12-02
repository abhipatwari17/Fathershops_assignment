# EKS Cluster
resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

   vpc_config {
   subnet_ids = [for subnet in aws_subnet.wp-private-tf : subnet.id]  # Map subnet objects to their IDs
  }
}
