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

#output "nginx_namespace" {
#  description = "Namespace where nginx is deployed"
#  value       = kubernetes_namespace.nginx.metadata[0].name
#}
#
#output "nginx_service_url" {
#  description = "URL to access nginx service"
#  value       = "http://localhost:30080"
#}
#
#output "nginx_deployment_name" {
#  description = "Name of the nginx deployment"
#  value       = kubernetes_deployment.nginx.metadata[0].name
#}
