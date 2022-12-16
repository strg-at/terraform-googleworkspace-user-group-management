# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


variable "groups" {
  description = "contains objects representing all defined Google Groups"
  type = map(object({
    email : string,
    name : string,
    description : optional(string),
    settings : optional(string),
    aliases : optional(list(string)),
    members : optional(list(string)),
  }))
}

variable "group_settings" {
  description = "contains all defined group setting templates for Google Groups"
  type = map(object({
    allow_external_members : optional(bool),
    allow_web_posting : optional(bool),
    archive_only : optional(bool),
    enable_collaborative_inbox : optional(bool),
    include_in_global_address_list : optional(bool),
    is_archived : optional(bool),
    members_can_post_as_the_group : optional(bool),
    message_moderation_level : optional(string),
    reply_to : optional(string),
    spam_moderation_level : optional(string),
    who_can_assist_content : optional(string),
    who_can_contact_owner : optional(string),
    who_can_discover_group : optional(string),
    who_can_join : optional(string),
    who_can_leave_group : optional(string),
    who_can_moderate_content : optional(string),
    who_can_moderate_members : optional(string),
    who_can_post_message : optional(string),
    who_can_view_group : optional(string),
    who_can_view_membership : optional(string),
  }))
}

variable "users" {
  description = "contains objects representing all defined Google Users"
  type = map(object({
    primary_email : string,
    given_name : string,
    family_name : string,
    password : optional(string),
    aliases : optional(list(string)),
    archived : optional(bool),
    include_in_global_address_list : optional(bool),
    ip_allowlist : optional(bool),
    is_admin : optional(bool),
    org_unit_path : optional(string),
    suspended : optional(bool),
    roles : optional(list(string)),
  }))
}

variable "password" {
  description = "contains a given password required for Users"
  type        = string
  default     = null
}

variable "users_external" {
  description = "contains objects representing all defined external Users"
  type = map(object({
    roles : list(string),
  }))
  default = {}
}
