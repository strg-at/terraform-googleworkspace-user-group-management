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

variable "user_external" {
  description = "contains an object representing an external User"
  type = object({
    roles : list(object({
      group : string,
      delivery_settings : optional(string),
      role : optional(string),
      type : optional(string)
    })),
  })

  validation {
    condition     = alltrue(flatten([for role in var.user_external.roles : contains(keys(var.groups), role.group)]))
    error_message = "All groups must be defined in the groups variable."
  }
}

variable "user_external_email" {
  description = "contains the external User email"
  type        = string
}
