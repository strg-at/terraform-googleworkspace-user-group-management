# Example Provider Authentication

This folder contains an example on how to implement the Google Workspace Authentication for Terraform without the need to store credentials somewhere.

This example also provides full impersonation, so the actor will be able to maintain super admin resources (f.e. Role assignments).

For other authentication methods please check [Terraform googleworkspace provider documentation](https://registry.terraform.io/providers/hashicorp/googleworkspace/latest/docs#authorization).

The [main.tf](main.tf) contains the terraform resources for the Google Cloud part (service account creation and roles). Besides that the configuration of Google Workspace domain-wide delegation still has to be done, see below.

## Full impersonation with short-lived credentials

1. Google Cloud: create service account

   - Go to [IAM service accounts](https://console.developers.google.com/iam-admin/serviceaccounts) in Google Cloud.
   - Create a service account (no optional stuff is needed).

2. Google Cloud: add roles to service account

   - Select the service account.
   - Go to `Permissions` and grant the following roles:

     - the service account itself: `Service Account Token Creator` (selection from the menu is not possible, instead copy/paste the service account email and grant role)
     - the actor who will execute the terraform commands: `Service Account User` and `Service Account Token Creator`

   - Go to `Details` and copy the unique id.

3. Google Workspace: add service account to domain-wide delegation

   - Go to [domain-wide delegation](https://admin.google.com/ac/owl/domainwidedelegation) in Google Admin console.

   - `Add new` and paste the service account id copied before (service account details) and add the oauth scopes. For this module the following oauth scopes are needed:

     ```console
     https://www.googleapis.com/auth/admin.directory.group,
     https://www.googleapis.com/auth/admin.directory.user,
     https://www.googleapis.com/auth/admin.directory.userschema,
     https://www.googleapis.com/auth/apps.groups.settings,
     https://www.googleapis.com/auth/iam
     ```

     The exact same scopes need to be provided to the googleworkspace provider.

4. Authenticate with Google Cloud

   Run `gcloud auth application-default login` to authenticate with GCP.
