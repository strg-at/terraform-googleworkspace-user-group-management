# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


variable "group" {
  description = "contains an object representing a Google Group"
  type = object({
    email : string,
    name : string,
    description : optional(string),
    settings : optional(string),
    aliases : optional(list(string)),
    members : optional(list(string)),
  })
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
