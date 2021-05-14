# ---------------------------------------------------------------------------------------------------------------------
# PROVIDE CREDENTIALS TO GSUITE PROVIDER
# Credentials are stored in terraform.tfvars file.
# ---------------------------------------------------------------------------------------------------------------------

provider "gsuite" {
  impersonated_user_email = var.impersonated_user_email
  credentials             = var.credentials
  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/apps.groups.settings",
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
  ]
}
