# -------------------------------------------------------------------------------------------
# CONFIGURE PROVIDER
# -------------------------------------------------------------------------------------------


terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.50.0"
    }
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "0.7.0"
    }
  }
}

# -------------------------------------------------------------------------------------------
# configure service account in google cloud
# -------------------------------------------------------------------------------------------

# create gcp service account
resource "google_service_account" "gworkspace_sa" {
  account_id   = "gworkspace-sa"
  display_name = "gworkspace-sa"
  description  = "domain-wide delegation in gworkspace, terraform-managed"
  project      = "" # add project_id here
}


# bind gcp service account impersonation
resource "google_service_account_iam_binding" "gworkspace_sa_serviceAccountUser" {
  service_account_id = google_service_account.gworkspace_sa.id
  role               = "roles/iam.serviceAccountUser"
  members = [
    "user:actor@example.io", # add actor that will be able to execute tf commands here
  ]
}

# grant service account impersonation members token creator
resource "google_service_account_iam_binding" "gworkspace_sa_serviceAccountTokenCreator" {
  service_account_id = google_service_account.gworkspace_sa.id
  role               = "roles/iam.serviceAccountTokenCreator"
  members = [
    "user:actor@example.io", # add actor that will be able to execute tf commands here
    "serviceAccount:${google_service_account.gworkspace_sa.email}",
  ]
}

# -------------------------------------------------------------------------------------------
# Google Workspace Domain-wide delegation
# -------------------------------------------------------------------------------------------
# this has to be done on google workspace side, see README.md.

# -------------------------------------------------------------------------------------------
# get short-lived token for service account
# -------------------------------------------------------------------------------------------

data "google_service_account_access_token" "gworkspace_sa" {
  target_service_account = google_service_account.gworkspace_sa.email
  scopes = [
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
    "https://www.googleapis.com/auth/apps.groups.settings",
    "https://www.googleapis.com/auth/iam",
  ]
}

# -------------------------------------------------------------------------------------------
# configure provider
# -------------------------------------------------------------------------------------------

provider "googleworkspace" {
  customer_id             = "" # insert customer id here
  impersonated_user_email = "" # insert email of a google workspace super admin here
  service_account         = google_service_account.gworkspace_sa.email
  access_token            = data.google_service_account_access_token.gworkspace_sa.access_token
  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
    "https://www.googleapis.com/auth/apps.groups.settings",
    "https://www.googleapis.com/auth/iam",
  ]
}
