# ---------------------------------------------------------------------------------------------------------------------
# MANAGE USERS AND GROUPS IN GOOGLE WORKSPACE
# These templates show an example of how to use the terraform-gsuite-user-group-management module to manage Users and
# Groups in Google Workspace. Local YAML files are used as data source.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.58"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# ADD CREDENTIALS FOR GSUITE PROVIDER
# See example-gsuite-authentication
# ---------------------------------------------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------------------------------------
# DATA SOURCE FROM LOCAL
# YAML files are stored locally. For YAML example files see example-yaml-files.
# ---------------------------------------------------------------------------------------------------------------------

locals {
  groups         = yamldecode(file("${path.module}/groups.yaml"))
  group_settings = yamldecode(file("${path.module}/group-settings.yaml"))
  users          = yamldecode(file("${path.module}/users.yaml"))
  users_external = yamldecode(file("${path.module}/users_external.yaml"))
}

# ---------------------------------------------------------------------------------------------------------------------
# GOOGLE WORKSPACE USER-GROUP MANAGEMENT MODULE
# The module expects groups and users. users_external is optional.
# ---------------------------------------------------------------------------------------------------------------------

module "user-group-management" {
  source  = "strg-at/user-group-management/gsuite"
  version = "0.3.0"
  providers = {
    gsuite = gsuite
  }
  groups         = local.groups
  group_settings = local.group_settings
  users          = local.users
  users_external = local.users_external
}
