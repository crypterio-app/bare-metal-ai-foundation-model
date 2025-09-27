
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  version    = "8.5.3"   # <-- Latest Helm chart version
  create_namespace = true
  timeout    = 300
  values = [
    file("./modules/argo/argo-values.yaml")
  ]
}


