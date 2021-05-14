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
  groups = yamldecode(file("${path.module}/groups.yaml"))
  users  = yamldecode(file("${path.module}/users.yaml"))
}

# ---------------------------------------------------------------------------------------------------------------------
# GOOGLE WORKSPACE USER-GROUP MANAGEMENT MODULE
# The original Github Repo is used as source to ensure future updates. The module expects groups and users data.
# ---------------------------------------------------------------------------------------------------------------------

module "user-group-management" {
  source = "strg-at/user-group-management/gsuite"
  version = "0.1.0"
  providers = {
    gsuite = gsuite
  }
  groups = local.groups
  users  = local.users
}
