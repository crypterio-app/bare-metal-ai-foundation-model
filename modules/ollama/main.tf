
resource "helm_release" "ollama" {
  name             = "ollama"
  repository       = "https://otwld.github.io/ollama-helm/"
  chart            = "ollama"
  namespace        = "anythingllm"
  create_namespace = true

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "service.port"
    value = "11434"
  }

  set {
    name  = "resources.requests.cpu"
    value = "2"
  }

  set {
    name  = "resources.requests.memory"
    value = "4Gi"
  }
}
