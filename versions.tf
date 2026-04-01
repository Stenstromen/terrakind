terraform {
  required_version = ">= 1.0"

  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.9.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = "1.8.3"
    }
  }
}
