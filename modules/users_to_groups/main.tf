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

  group_id          = var.groups[each.value.group].email
  email             = var.user.primary_email
  delivery_settings = coalesce(each.value.delivery_settings, "ALL_MAIL") # defaults to ALL_MAIL
  role              = coalesce(each.value.role, "MEMBER")                # defaults to MEMBER
  type              = coalesce(each.value.type, "USER")                  # defaults to USER
}
