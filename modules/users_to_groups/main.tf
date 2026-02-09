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
  for_each = { for idx, role in var.user.roles : role.group => role }

  group_id = var.groups[each.value.group].email
  email    = var.user.primary_email
  role     = coalesce(each.value.role, "MEMBER")
  type     = coalesce(each.value.type, "USER")

  lifecycle {
    ignore_changes = [
      delivery_settings,
    ]
  }
}
