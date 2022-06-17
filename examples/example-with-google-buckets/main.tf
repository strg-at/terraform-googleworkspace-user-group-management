# MANAGE USERS AND GROUPS IN GOOGLE WORKSPACE
# These templates show an example of how to use the terraform-gsuite-user-group-management module to manage Users and
# Groups in Google Workspace. Google Buckets are used as data source.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.58"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.66.1"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# ADD CREDENTIALS FOR GSUITE PROVIDER
# See example-gsuite-authentication
# ---------------------------------------------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------------------------------------
# DATA SOURCE FROM GOOGLE BUCKET
# YAML files are stored in Google Buckets with versioning enabled. Each YAML file gets its own reference. For YAML
# example files see example-yaml-files.
# ---------------------------------------------------------------------------------------------------------------------

data "google_storage_bucket_object_content" "groups" {
  name   = "groups.yaml"
  bucket = "example-data"
}

data "google_storage_bucket_object_content" "group_settings" {
  name   = "group_settings.yaml"
  bucket = "example-data"
}

data "google_storage_bucket_object_content" "users" {
  name   = "users.yaml"
  bucket = "example-data"
}

data "google_storage_bucket_object_content" "users_external" {
  name   = "users_external.yaml"
  bucket = "example-data"
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
  groups         = yamldecode(data.google_storage_bucket_object_content.groups.content)
  group_settings = yamldecode(data.google_storage_bucket_object_content.group_settings.content)
  users          = yamldecode(data.google_storage_bucket_object_content.users.content)
  users_external = yamldecode(data.google_storage_bucket_object_content.users_external.content)
}
