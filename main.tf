terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.62"
    }
  }
}

module "groups" {
  for_each = var.groups
  source   = "./modules/groups"
  providers = {
    gsuite = gsuite
  }
  group = each.value
}

module "group_settings" {
  for_each = var.groups
  depends_on = [module.groups]
  source   = "./modules/group_settings"
  providers = {
    gsuite = gsuite
  }
  group_settings = var.group_settings
  group          = each.value
}

module "groups_in_group" {
  for_each   = var.groups
  depends_on = [module.groups]
  source     = "./modules/groups_in_group"
  providers = {
    gsuite = gsuite
  }
  groups = var.groups
  group  = each.value
}

module "users" {
  for_each   = var.users
  depends_on = [module.groups]
  source     = "./modules/users"
  providers = {
    gsuite = gsuite
  }
  user = each.value
}

module "users_external_to_groups" {
  for_each   = var.users_external
  depends_on = [module.groups]
  source     = "./modules/users_external_to_groups"
  providers = {
    gsuite = gsuite
  }
  groups              = var.groups
  user_external       = each.value
  user_external_email = each.key
}

module "users_to_groups" {
  for_each   = var.users
  depends_on = [module.users]
  source     = "./modules/users_to_groups"
  providers = {
    gsuite = gsuite
  }
  groups = var.groups
  user   = each.value
}
