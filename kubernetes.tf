resource "kubernetes_namespace" "nginx" {
  metadata {
    name = "nginx"
  }

  depends_on = [kind_cluster.default]

  lifecycle {
    replace_triggered_by = [
      kind_cluster.default
    ]
  }
}

resource "kubernetes_config_map" "nginx_config" {
  metadata {
    name      = "nginx-config"
    namespace = kubernetes_namespace.nginx.metadata[0].name
  }

  data = {
    "nginx.conf" = file("${path.module}/nginx.conf")
  }

  depends_on = [kind_cluster.default]

  lifecycle {
    replace_triggered_by = [
      kind_cluster.default
    ]
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-deployment"
    namespace = kubernetes_namespace.nginx.metadata[0].name
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        volume {
          name = "nginx-config"
          config_map {
            name = kubernetes_config_map.nginx_config.metadata[0].name
          }
        }
        container {
          image = "nginx:latest"
          name  = "nginx"

          port {
            container_port = 80
          }

          volume_mount {
            name       = "nginx-config"
            mount_path = "/etc/nginx/nginx.conf"
            sub_path   = "nginx.conf"
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }

  depends_on = [kind_cluster.default]

  lifecycle {
    replace_triggered_by = [
      kind_cluster.default
    ]
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.nginx.metadata[0].name
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
      node_port   = 30080
    }

    type = "NodePort"
  }

  depends_on = [kubernetes_deployment.nginx]

  lifecycle {
    replace_triggered_by = [
      kind_cluster.default
    ]
  }
}
