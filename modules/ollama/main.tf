
resource "helm_release" "ollama" {
  name             = "ollama"
  repository       = "https://otwld.github.io/ollama-helm/"
  chart            = "ollama"
  namespace        = "anythingllm"
  create_namespace = true

  atomic           = false   # prevents automatic rollback on timeout
  cleanup_on_fail  = true
  timeout          = 900     # 15 min, Airflow may take long to deploy

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

  # Add the model you want to deploy
  set {
    name  = "models[0].name"
    value = "llama2"       # must match the actual model name in Ollama
  }

  # Optional: specify model version or variant
  set {
    name  = "models[0].version"
    value = "13b"          # e.g., "13b" or "7b"
  }
}
