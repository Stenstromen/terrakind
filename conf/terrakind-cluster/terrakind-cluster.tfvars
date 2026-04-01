cluster_name       = "terrakind-cluster"
node_image         = "kindest/node:v1.35.0"
kind_api_version   = "kind.x-k8s.io/v1alpha4"
worker_nodes       = 3
github_org         = "stenstromen"
github_repository  = "terrakind"
flux_branch        = "main"
flux_path          = "clusters/terrakind-cluster"