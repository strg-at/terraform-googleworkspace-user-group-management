variable "user" {
  type        = any
  description = "contains an object representing a Google User"
}

variable "groups" {
  type        = map(any)
  description = "contains objects representing all defined Google Groups"
}
