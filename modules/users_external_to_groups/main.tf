terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.62"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/DeviaVir/gsuite/latest/docs/resources/group_member
# ---------------------------------------------------------------------------------------------------------------------

resource "gsuite_group_member" "group" {
  for_each = toset(var.user_external.roles)
  group    = var.groups[each.value].email
  email    = var.user_external_email
}
