
resource "helm_release" "rancher" {
  name       = "rancher"
  namespace  = "dev"
  repository = "https://releases.rancher.com/server-charts/latest"
  chart      = "rancher"
  timeout    = 6000
  set {
    name  = "hostname"
    value = "sai22.eastus.cloudapp.azure.com"
  }

  set {
    name  = "replicas"
    value = "3"
  }

  set {
    name  = "tls.source"
    value = "letsEncrypt"
  }
  set {
    name  = "letsEncrypt.email"
    value = "me@example.org"
  }
  set {
    name  = "letsEncrypt.ingress.class"
    value = "nginx"
  }

}


resource "rancher2_project" "project" {
  depends_on = [helm_release.rancher]
  name = "saiprakash"
  cluster_id = "local"
  resource_quota {
    project_limit {
      limits_cpu = "2000m"
      limits_memory = "2000Mi"
      requests_storage = "2Gi"
    }
    namespace_default_limit {
      limits_cpu = "2000m"
      limits_memory = "500Mi"
      requests_storage = "1Gi"
    }
  }
  container_resource_limit {
    limits_cpu = "20m"
    limits_memory = "20Mi"
    requests_cpu = "1m"
    requests_memory = "1Mi"
  }
}
