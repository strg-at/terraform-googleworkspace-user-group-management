terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.62"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/DeviaVir/gsuite/latest/docs/resources/user
# ---------------------------------------------------------------------------------------------------------------------

resource "gsuite_user" "user" {
  name = {
    family_name = var.user.family_name
    given_name  = var.user.given_name
  }
  primary_email          = var.user.primary_email
  org_unit_path          = var.user.org_unit_path
  is_suspended           = var.user.is_suspended
  suspension_reason      = var.user.suspension_reason
  aliases                = var.user.aliases
  include_in_global_list = var.user.include_in_global_list

  lifecycle {
    ignore_changes = [
      recovery_email,
      recovery_phone
    ]
  }
}
