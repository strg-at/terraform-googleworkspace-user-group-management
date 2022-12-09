# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


variable "user" {
  description = "contains an object representing a Google User"
  type = object({
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
  })
}
