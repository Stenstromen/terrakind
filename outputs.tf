output "cluster_name" {
  description = "Name of the Kind cluster"
  value       = kind_cluster.default.name
}

output "kubeconfig" {
  description = "Kubeconfig for the Kind cluster"
  value       = kind_cluster.default.kubeconfig
  sensitive   = true
}

output "cluster_endpoint" {
  description = "Kubernetes cluster endpoint"
  value       = kind_cluster.default.endpoint
}
