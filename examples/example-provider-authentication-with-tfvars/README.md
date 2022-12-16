# Example Provider Authentication

This folder contains an example how to implement the GSuite Authentication for Terraform.

## Google Cloud Service account

### Setup Service Account

[Google SDK Documentation about Delegation](https://developers.google.com/admin-sdk/directory/v1/guides/delegation)

Go to [IAM service accounts](https://console.developers.google.com/iam-admin/serviceaccounts) and create a Service account.

- enter Service account name
- add yourself to 'Grant users access to this service account'

### Add key

In the Service account overview open the 'Actions' menu on the right of the dedicated service account and choose **Manage keys**. Click on 'Add key' and create a new key in JSON format, this key will be used for Terraform.
Go back to Details and copy the Unique ID.

### Add service account to domain-wide delegation for GWorkspace

Go to [Google Admin console Domain wide delegation](https://admin.google.com/ac/owl/domainwidedelegation).

Get the Service account with the ID provided before (Service account details), then add the following oauth scopes:

```console
https://www.googleapis.com/auth/admin.directory.user,
https://www.googleapis.com/auth/admin.directory.userschema,
https://www.googleapis.com/auth/admin.directory.group,
https://www.googleapis.com/auth/apps.groups.settings
```

### Provide Service account credentials to Terraform Provider

Add credentials to terraform.tfvars, see [terraform.tfvars.example](terraform.tfvars.example).
For Googleworkspace Customer ID, see [Find your customer ID](https://support.google.com/a/answer/10070793?hl=en).
