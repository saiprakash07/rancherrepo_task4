terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.22.2"
    }
  }
}

data "azurerm_kubernetes_cluster" "credentials" {
  name                = "example-aks1"
  resource_group_name = "rg1"
}


provider "helm" {

  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.credentials.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate)

  }
}

provider "rancher2" {
 api_url = "https://saiprakash08.westus2.cloudapp.azure.com"
 access_key = "token-2mw2f"
 secret_key = "7pwth5pfn4dwl82s8jj5h776f9w9hhmcwxnh4cb9gnbvtdqlxqtrmf"
}
