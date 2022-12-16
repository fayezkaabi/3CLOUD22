terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
#  required_version = ">= 0.13"
}

provider "scaleway" {
  zone   = "fr-par-1"
  region = "fr-par"
}

variable "project_id" {
  type        = string
  default = "b73790d7-afbb-40b5-bed0-2f3c446da796"
  description = "Versailles Hexagone"
}
