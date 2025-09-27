resource "helm_release" "anythingllm" {
  name             = "anythingllm"
  repository       = "https://la-cc.github.io/anything-llm-helm-chart"
  chart            = "anything-llm"
  namespace        = "anythingllm"
  create_namespace = true

  atomic           = false   # prevents automatic rollback on timeout
  cleanup_on_fail  = true
  timeout          = 900     # 15 min, Airflow may take long to deploy

  set {
    name  = "chromadb.enabled"
    value = "true"
  }

  set {
    name  = "config.VECTOR_DB"
    value = "chroma"
  }

  # 👇 Add Ollama provider config
  set {
    name  = "config.LLM_PROVIDER"
    value = "ollama"
  }

  set {
    name  = "config.OLLAMA_BASE_URL"
    value = "http://ollama.anythingllm.svc.cluster.local:11434"
  }

  set {
    name  = "config.MODEL"
    value = "llama3"
  }

  set {
    name  = "config.ADMIN_EMAIL"
    value = "admin@example.com"
  }

  set {
    name  = "config.ADMIN_PASSWORD"
    value = "SuperSecurePassword123!"
  }
}
