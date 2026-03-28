terraform {
  required_version = ">= 1.0"

  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.38"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17"
    }
    flux = {
      source  = "fluxcd/flux"
      version = "1.8.3"
    }
  }
}
