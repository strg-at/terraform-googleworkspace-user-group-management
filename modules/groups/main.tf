terraform {
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "0.6.0"
    }
  }
}

# ----------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/hashicorp/googleworkspace/latest/docs/resources/group
# ----------------------------------------------------------------------------------------------------------------------

resource "googleworkspace_group" "group" {
  email       = var.group.email
  name        = var.group.name
  description = "Managed with Terraform"
  aliases     = var.group.aliases
}
