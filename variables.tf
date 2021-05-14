variable "groups" {
  type        = map(any)
  description = "contains objects representing all defined Google Groups"
}

variable "users" {
  type        = map(any)
  description = "contains objects representing all defined Google Users"
}
