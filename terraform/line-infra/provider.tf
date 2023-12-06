terraform {
  required_providers {
    exoscale = {
      source = "exoscale/exoscale"
      version = "0.54.1"
    }
  }
}

variable "EXOSCALE_API_KEY" { type = string }
variable "EXOSCALE_API_SECRET" { type = string }
provider "exoscale" {
  key    = var.EXOSCALE_API_KEY
  secret = var.EXOSCALE_API_SECRET
}
