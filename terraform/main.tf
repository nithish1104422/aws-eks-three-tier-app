module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  # Managed Node Groups
  managed_node_groups = {
    eks_nodes = {
      desired_capacity = var.node_desired_capacity
      max_size         = var.node_max_size
      min_size         = var.node_min_size

      instance_types = [var.node_instance_type]
      key_name       = var.ssh_key_name
    }
  }

  tags = var.tags
}
