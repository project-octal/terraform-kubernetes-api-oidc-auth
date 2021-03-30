variable "oidc_groups_prefix" {
  type        = string
  description = "The prefix attached to OIDC groups bound to cluster roles. Needs to match the value given to the kube-api-server argument `--oidc-groups-prefix`"
  default     = "oidc:"
}

variable "oidc_cluster_role_bindings" {
  type = set(object({
    cluster_role_name = string
    oidc_group_name   = string
  }))
  description = "The name of the OIDC groups to bind to the builtin `cluster-admin` cluster role."
  default     = []
}
