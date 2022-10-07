resource "aws_eks_cluster" "demo-cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks-iam-role.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids = [var.subnet_id_1, var.subnet_id_2]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  depends_on = [
     aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  ]
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name    = aws_eks_cluster.demo-cluster.name
  node_group_name = var.eks_node_groupname
  node_role_arn   = aws_iam_role.eks-workernode-role.arn
  subnet_ids      = [var.subnet_id_1, var.subnet_id_2]
  instance_types  = [var.node_instance_type]
  capacity_type  = "ON_DEMAND"

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
  ]
}
