terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.62"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/DeviaVir/gsuite/latest/docs/resources/group_settings
# ---------------------------------------------------------------------------------------------------------------------

resource "gsuite_group_settings" "group_settings" {
  email = var.group.email

  allow_external_members         = var.group_settings[var.group.settings].allow_external_members
  allow_web_posting              = var.group_settings[var.group.settings].allow_web_posting
  archive_only                   = var.group_settings[var.group.settings].archive_only
  include_in_global_address_list = var.group_settings[var.group.settings].include_in_global_address_list
  spam_moderation_level          = var.group_settings[var.group.settings].spam_moderation_level
  who_can_contact_owner          = var.group_settings[var.group.settings].who_can_contact_owner
  who_can_discover_group         = var.group_settings[var.group.settings].who_can_discover_group
  who_can_join                   = var.group_settings[var.group.settings].who_can_join
  who_can_leave_group            = var.group_settings[var.group.settings].who_can_leave_group
  who_can_post_message           = var.group_settings[var.group.settings].who_can_post_message
  who_can_view_group             = var.group_settings[var.group.settings].who_can_view_group
  who_can_view_membership        = var.group_settings[var.group.settings].who_can_view_membership
}
