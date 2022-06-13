terraform {
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "0.6.0"
    }
  }
}

# -----------------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/hashicorp/googleworkspace/latest/docs/resources/group_member
# -----------------------------------------------------------------------------------------------------------------------------

resource "googleworkspace_group_member" "group" {
  for_each = toset(var.user_external.roles)
  group_id = var.groups[each.value].email
  email    = var.user_external_email
}
