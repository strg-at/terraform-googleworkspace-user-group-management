terraform {
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "0.7.0"
    }
  }
}

module "groups" {
  for_each = var.groups
  source   = "./modules/groups"
  providers = {
    googleworkspace = googleworkspace
  }
  group = each.value
}

module "group_settings" {
  for_each   = var.groups
  depends_on = [module.groups]
  source     = "./modules/group_settings"
  providers = {
    googleworkspace = googleworkspace
  }
  group_settings = var.group_settings
  group          = each.value
}

module "groups_in_group" {
  for_each   = var.groups
  depends_on = [module.groups]
  source     = "./modules/groups_in_group"
  providers = {
    googleworkspace = googleworkspace
  }
  groups = var.groups
  group  = each.value
}

module "users" {
  for_each   = var.users
  depends_on = [module.groups]
  source     = "./modules/users"
  providers = {
    googleworkspace = googleworkspace
  }
  user = each.value
}

module "users_external_to_groups" {
  for_each   = var.users_external
  depends_on = [module.groups]
  source     = "./modules/users_external_to_groups"
  providers = {
    googleworkspace = googleworkspace
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
    googleworkspace = googleworkspace
  }
  groups = var.groups
  user   = each.value
}
