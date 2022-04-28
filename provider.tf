terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.22.2"
    }
  }
}


provider "rancher2" {
 api_url = "https://saiprakash08.westus2.cloudapp.azure.com"
 access_key = "token-2mw2f"
 secret_key = "7pwth5pfn4dwl82s8jj5h776f9w9hhmcwxnh4cb9gnbvtdqlxqtrmf"
}
