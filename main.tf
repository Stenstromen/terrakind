resource "flux_bootstrap_git" "this" {
  depends_on = [kind_cluster.default]

  embedded_manifests = true
  path               = var.flux_path
}