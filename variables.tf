variable "node_image" {
  description = "Image to use for the Kind cluster"
  type        = string
  default     = "kindest/node:v1.34.0"
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