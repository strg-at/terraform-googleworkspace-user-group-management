terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.58"
    }
  }
}

variable "groups" {
  type        = map(any)
  description = "contains objects representing all defined Google Groups"
}
variable "users" {
  type        = map(any)
  description = "contains objects representing all defined Google Users"
}

module "groups" {
  for_each = var.groups
  source   = "./groups"
  providers = {
    gsuite = gsuite
  }
  group = each.value
}

module "users" {
  for_each   = var.users
  depends_on = [module.groups]
  source     = "./users"
  providers = {
    gsuite = gsuite
  }
  groups = var.groups
  user   = each.value
}