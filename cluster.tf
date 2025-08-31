resource "kind_cluster" "default" {
  name           = var.cluster_name
  node_image     = var.node_image
  wait_for_ready = true

  lifecycle {
    prevent_destroy = false

    create_before_destroy = true
  }

  kind_config {
    kind        = "Cluster"
    api_version = var.kind_api_version

    node {
      role = "control-plane"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\""
      ]

      extra_port_mappings {
        container_port = 80
        host_port      = 8080
      }
      extra_port_mappings {
        container_port = 443
        host_port      = 8443
      }
      extra_port_mappings {
        container_port = 30080
        host_port      = 30080
      }
    }

    node {
      role = "worker"
    }
  }
}
