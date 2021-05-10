variable "groups" {
  type        = map(any)
  description = "contains objects representing all defined Google Groups"
}

variable "group" {
  type        = any
  description = "contains an object representing a Google Group"
}
