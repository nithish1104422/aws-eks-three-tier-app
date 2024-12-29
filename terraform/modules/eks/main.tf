module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  node_groups = {
    eks_nodes = {
      desired_capacity = var.node_desired_capacity
      max_size         = var.node_max_size
      min_size         = var.node_min_size

      instance_type    = var.node_instance_type
      key_name         = var.ssh_key_name
    }
  }

  tags = var.tags
}

# IAM roles and policies for EKS
resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.eks.eks_cluster_iam_role_name
}

resource "aws_iam_role_policy_attachment" "cloudwatch_policy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = module.eks.eks_cluster_iam_role_name
}
