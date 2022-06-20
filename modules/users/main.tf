terraform {
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "0.7.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/hashicorp/googleworkspace/latest/docs/resources/user
# ---------------------------------------------------------------------------------------------------------------------

resource "googleworkspace_user" "user" {
  primary_email = var.user.primary_email
  name {
    family_name = var.user.family_name
    given_name  = var.user.given_name
  }
  aliases                        = var.user.aliases
  include_in_global_address_list = var.user.include_in_global_address_list
  org_unit_path                  = var.user.org_unit_path
  archived                       = var.user.archived
  suspended                      = var.user.suspended

  lifecycle {
    ignore_changes = [
      recovery_email,
      recovery_phone
    ]
  }
}
