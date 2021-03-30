module "apiserver_ingress_route" {
  source = "github.com/project-octal/terraform-octal-ingress-route"

  name        = var.apiserver_service_name
  namespace   = var.apiserver_service_namespace
  labels      = var.labels
  cert_issuer = var.cluster_cert_issuer
  dns_name    = var.apiserver_url
  route_rules = [
    {
      match_rule  = "Host(`${var.apiserver_url}`)"
      middlewares = []
      services = [
        {
          name      = var.apiserver_service_name
          namespace = var.apiserver_service_namespace
          port      = 443
          scheme    = "https"
        }
      ]
    }
  ]
}