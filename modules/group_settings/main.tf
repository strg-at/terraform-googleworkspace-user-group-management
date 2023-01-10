terraform {
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "0.7.0"
    }
  }
}

# -------------------------------------------------------------------------------------------------------------------------------
# Ressource documentation: https://registry.terraform.io/providers/hashicorp/googleworkspace/latest/docs/resources/group_settings
# -------------------------------------------------------------------------------------------------------------------------------

resource "googleworkspace_group_settings" "group_settings" {
  email = var.group.email

  # workaround for
  # - https://github.com/hashicorp/terraform-provider-googleworkspace/issues/331
  # - https://github.com/hashicorp/terraform-provider-googleworkspace/issues/398
  # TODO: remove when solved
  # -----------------------------------------------------------------------------------------
  lifecycle {
    ignore_changes = [
      email,
      is_archived,
    ]
  }
  # -----------------------------------------------------------------------------------------

  allow_external_members         = var.group_settings[var.group.settings].allow_external_members
  allow_web_posting              = var.group_settings[var.group.settings].allow_web_posting
  archive_only                   = var.group_settings[var.group.settings].archive_only
  enable_collaborative_inbox     = var.group_settings[var.group.settings].enable_collaborative_inbox
  include_in_global_address_list = var.group_settings[var.group.settings].include_in_global_address_list
  is_archived                    = var.group_settings[var.group.settings].is_archived
  members_can_post_as_the_group  = var.group_settings[var.group.settings].members_can_post_as_the_group
  message_moderation_level       = var.group_settings[var.group.settings].message_moderation_level
  reply_to                       = var.group_settings[var.group.settings].reply_to
  spam_moderation_level          = var.group_settings[var.group.settings].spam_moderation_level
  who_can_assist_content         = var.group_settings[var.group.settings].who_can_assist_content
  who_can_moderate_content       = var.group_settings[var.group.settings].who_can_moderate_content
  who_can_moderate_members       = var.group_settings[var.group.settings].who_can_moderate_members
  who_can_contact_owner          = var.group_settings[var.group.settings].who_can_contact_owner
  who_can_discover_group         = var.group_settings[var.group.settings].who_can_discover_group
  who_can_join                   = var.group_settings[var.group.settings].who_can_join
  who_can_leave_group            = var.group_settings[var.group.settings].who_can_leave_group
  who_can_post_message           = var.group_settings[var.group.settings].who_can_post_message
  who_can_view_group             = var.group_settings[var.group.settings].who_can_view_group
  who_can_view_membership        = var.group_settings[var.group.settings].who_can_view_membership
}
