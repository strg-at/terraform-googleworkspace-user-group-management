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
  password = var.user.password != null ? var.user.password : var.random_password

  aliases                        = var.user.aliases
  archived                       = var.user.archived
  include_in_global_address_list = var.user.include_in_global_address_list
  ip_allowlist                   = var.user.ip_allowlist
  is_admin                       = var.user.is_admin
  org_unit_path                  = var.user.org_unit_path
  suspended                      = var.user.suspended

  lifecycle {
    ignore_changes = [
      password,
      recovery_email,
      recovery_phone,
    ]
  }
}
