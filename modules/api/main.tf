
resource "helm_release" "apisix" {
  name             = "apisix"
  namespace        = "apisix"
  create_namespace = true

  repository = "https://charts.apiseven.com"
  chart      = "apisix"
  version    = "2.11.5"  # pick the version you want

  # Example configuration via values
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "gateway.externalTrafficPolicy"
    value = "Cluster"
  }

  set {
    name  = "gateway.enabled"
    value = "true"
  }

  set {
    name  = "dashboard.enabled"
    value = "true"
  }

  set {
    name  = "dashboard.admin_user"
    value = "admin"
  }

  set {
    name  = "dashboard.admin_password"
    value = "SuperSecurePassword123!"
  }
}

