terraform {
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "0.7.0"
    }
  }
}

# -----------------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/hashicorp/googleworkspace/latest/docs/resources/group_member
# -----------------------------------------------------------------------------------------------------------------------------

resource "googleworkspace_group_member" "group" {
  for_each = toset(var.user.roles)
  group_id = var.groups[each.value].email
  email    = var.user.primary_email
}
