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

resource "gsuite_group_member" "member" {
  for_each = toset(var.group.groups)
  group    = var.group.email
  email    = var.groups[each.value].email
}
