# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


variable "user" {
  description = "contains an object representing a Google User"
  type = object({
    primary_email : string,
    given_name : string,
    family_name : string,
    password : string,
    aliases : optional(list(string)),
    archived : optional(bool),
    include_in_global_address_list : optional(bool),
    ip_allowlist : optional(bool),
    is_admin : optional(bool),
    org_unit_path : optional(string),
    suspended : optional(bool),
    roles : optional(list(object({
      group : string,
      delivery_settings : optional(string),
      role : optional(string),
      type : optional(string)
    }))),
  })

  validation {
    condition     = alltrue(flatten([for role in var.user.roles : contains(keys(var.groups), role.group)]))
    error_message = "All groups must be defined in the groups variable."
  }
}

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
