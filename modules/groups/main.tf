terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.62"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/DeviaVir/gsuite/latest/docs/resources/group
# ---------------------------------------------------------------------------------------------------------------------

resource "gsuite_group" "group" {
  email   = var.group.email
  name    = var.group.name
  aliases = var.group.aliases
}
