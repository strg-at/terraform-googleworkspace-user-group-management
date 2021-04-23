# Dynamic User- and Group Management for Google Workspace with Terraform
ISAS Implementation for User- and Group Management in Google Workspace (formerly GSuite).
## Prerequisites
### Local
* Terraform installed

### Google Cloud
#### **Setup Service Account**
[Google SDK Documentation about Delegation](https://developers.google.com/admin-sdk/directory/v1/guides/delegation)

Go to [IAM service accounts](https://console.developers.google.com/iam-admin/serviceaccounts) and create a Service account.
* enter Service account name
* add yourself to 'Grant users access to this service account'

#### **Add key**
In the Service account overview open the 'Actions' menu on the right of the dedicated service account and choose **Manage keys**.
Click on 'Add key' and create a new key in JSON format, this key will be used for Terraform.

#### **Add domain-wide delegation for GSuite**
In the Service account overview open the 'Actions' menu on the right of the dedicated service account and choose **Manage details**.

Open this part below and **Enable GSuite Domain-wide Delegation**.
* Enter Product name, f.e. Terraform GSuite service
* the impersonated user account will do the terraform job and needs admin permission.
* copy ID for next step

#### **Grant Google Workspace admin permissions**
Now go to [Google Admin Console](https://admin.google.com) and open the Burger menu on the left. Choose **Security** > **API controls**.

Get the Service account with the ID provided before (Service account details), then add the following oauth scopes:
```
https://www.googleapis.com/auth/admin.directory.user, https://www.googleapis.com/auth/admin.directory.userschema, https://www.googleapis.com/auth/admin.directory.group, https://www.googleapis.com/auth/apps.groups.settings
```

## Usage
### Provide Service account credentials to Terraform
```terraform
provider "gsuite" {
  impersonated_user_email = "jane@example.io"
  credentials             = "/path/to/google_credentials.json"
  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/apps.groups.settings",
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
  ]
}
```
It is also possible to use a *.tfvars file to define variables for the credentials and exclude this file in .gitignore.

### Data source examples
#### **Groups example structure**
```yaml
role:
  email: 'role@example.io'
  name: 'Example Role'
```

##### Groups in Group example structure
Group member have to be defined within the group definition.
```yaml
role:
  email: 'role@example.io'
  name: 'Example Role'
  groups:
    - alt_role
```
In this example the group 'alt_role' will be a member of the group 'role'.


#### **Users example structure**
```yaml
jane:
  family_name: 'Doe'
  given_name: 'Jane'
  primary_email: 'jane@example.io'
  recovery_email: 'jane@alternative-example.io'
  recovery_phone: '+10000'
  org_unit_path: /
  is_suspended: false
  suspension_reason: ''
  roles: 
    - role
```

### How to use this module
This is an example usage with local yaml files (see [Terraform yamldecode](https://www.terraform.io/docs/language/functions/yamldecode.html) for details). It is also possible to use any other sources like Github, which are defined by Terraform (see [Terraform module sources](https://www.terraform.io/docs/language/modules/sources.html) for details).

```terraform
locals {
  groups = yamldecode(file("${path.module}/groups.yaml"))
  users  = yamldecode(file("${path.module}/users.yaml"))
}

module "gworkspace" {
  source   = "https://github.com/strg-at/terraform-google-workspace-module.git"
  providers = {
    gsuite = gsuite
  }
  groups = local.groups
  users = local.users
}
```

## How to use Terraform
See [Terraform docs](https://www.terraform.io/docs/cli/run/index.html) for details.

## Authors

* **[Jasmin Müller](mailto:jasmin.mueller@strg.at)** (:octocat: [jazzlyn](https://github.com/jazzlyn)) - first implementation