variable "groups" {
  type        = map(any)
  description = "contains objects representing all defined Google Groups"
}

variable "users" {
  type        = map(any)
  description = "contains objects representing all defined Google Users"
}

variable "users_external" {
  type        = map(any)
  default     = {}
  description = "contains objects representing all defined external Users"
}
