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

resource "googleworkspace_group_member" "member" {
  for_each = toset(var.group.members)
  group_id = var.group.email
  email    = var.groups[each.value].email
  type     = "GROUP"
}
