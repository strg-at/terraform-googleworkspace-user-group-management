variable "user_external" {
  type        = map(any)
  description = "contains an object representing an external User"
}

variable "user_external_email" {
  type        = string
  description = "contains the external User email"
}

variable "groups" {
  type        = map(any)
  description = "contains objects representing all defined Google Groups"
}
