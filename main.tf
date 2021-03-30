resource "kubernetes_cluster_role_binding" "oidc_cluster_role_bindings" {
  for_each = var.cluster_role_bindings

  metadata {
    name = "oidc-${each.value["oidc_group_name"]}-${each.value["cluster_role_name"]}"
    labels = {}
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "ClusterRole"
    name = each.value["cluster_role_name"]
  }
  subject {
    kind = "Group"
    name = "${var.oidc_groups_prefix}${each.value["oidc_group_name"]}"
  }
}