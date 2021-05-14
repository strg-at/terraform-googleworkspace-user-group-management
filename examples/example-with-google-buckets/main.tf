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

data "google_storage_bucket_object_content" "users" {
  name   = "users.yaml"
  bucket = "example-data"
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
  groups = yamldecode(data.google_storage_bucket_object_content.groups.content)
  users  = yamldecode(data.google_storage_bucket_object_content.users.content)
}
