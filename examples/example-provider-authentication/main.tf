# ---------------------------------------------------------------------------------------------------------------------
# PROVIDE CREDENTIALS TO PROVIDER
# Credentials are stored in terraform.tfvars file.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = ""
    }
  }
}

provider "googleworkspace" {
  customer_id             = var.gworkspace_customer_id
  impersonated_user_email = var.gworkspace_email
  credentials             = var.gworkspace_credentials
  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/apps.groups.settings",
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
  ]
}
