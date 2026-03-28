# This file is now empty as resources have been organized into:
# - cluster.tf: Kind cluster creation and configuration
# - kubernetes.tf: Kubernetes resources (namespaces, deployments, services)

resource "flux_bootstrap_git" "this" {
  depends_on = [kind_cluster.default]

  embedded_manifests = true
  path               = "clusters/terrakind-cluster"
}