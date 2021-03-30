resource "kubernetes_cluster_role_binding" "oidc_cluster_role_bindings" {
  count = length(var.oidc_cluster_role_bindings)

  metadata {
    name   = "oidc-${var.oidc_cluster_role_bindings[count.index].oidc_group_name}-${var.oidc_cluster_role_bindings[count.index].cluster_role_name}"
    labels = {}
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = var.oidc_cluster_role_bindings[count.index].cluster_role_name
  }
  subject {
    kind = "Group"
    name = "${var.oidc_groups_prefix}${var.oidc_cluster_role_bindings[count.index].oidc_group_name}"
  }
}