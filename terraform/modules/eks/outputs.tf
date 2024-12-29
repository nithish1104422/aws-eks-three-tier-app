output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_kubeconfig" {
  description = "Kubeconfig file for the EKS cluster"
  value       = module.eks.kubeconfig
}

output "eks_node_group_arn" {
  description = "ARN of the EKS node group"
  value       = module.eks.node_groups["eks_nodes"].arn
}

output "eks_node_security_group" {
  description = "Security group for the worker nodes"
  value       = module.eks.node_groups["eks_nodes"].security_group_id
}
