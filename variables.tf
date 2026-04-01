variable "node_image" {
  description = "Image to use for the Kind cluster"
  type        = string
  default     = "kindest/node:v1.35.0"
}

variable "kind_api_version" {
  description = "API version to use for the Kind cluster"
  type        = string
  default     = "kind.x-k8s.io/v1alpha4"
}

variable "cluster_name" {
  description = "Name of the Kind cluster"
  type        = string
  default     = "terrakind-cluster"
}

variable "worker_nodes" {
  description = "Number of worker nodes in the Kind cluster"
  type        = number
  default     = 3
}

variable "github_token" {
  description = "GitHub token"
  sensitive   = true
  type        = string
  default     = ""
}

variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = "stenstromen"
}

variable "github_repository" {
  description = "GitHub repository"
  type        = string
  default     = "terrakind"
}

variable "flux_branch" {
  description = "Branch to use for the Flux repository"
  type        = string
  default     = "main"
}

variable "flux_path" {
  description = "Path to use for the Flux repository"
  type        = string
  default     = "clusters/terrakind-cluster"
}