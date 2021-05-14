# Example GSuite Authentication
This folder contains an example how to implement the GSuite Authentication for Terraform.
## Google Cloud Service account
### **Setup Service Account**
[Google SDK Documentation about Delegation](https://developers.google.com/admin-sdk/directory/v1/guides/delegation)

Go to [IAM service accounts](https://console.developers.google.com/iam-admin/serviceaccounts) and create a Service account.
* enter Service account name
* add yourself to 'Grant users access to this service account'

### **Add key**
In the Service account overview open the 'Actions' menu on the right of the dedicated service account and choose **Manage keys**.
Click on 'Add key' and create a new key in JSON format, this key will be used for Terraform.

### **Add domain-wide delegation for GSuite**
In the Service account overview open the 'Actions' menu on the right of the dedicated service account and choose **Manage details**.

Open this part below and **Enable GSuite Domain-wide Delegation**.
* Enter Product name, f.e. Terraform GSuite service
* the impersonated user account will do the terraform job and needs admin permission.
* copy ID for next step

### **Grant Google Workspace admin permissions**
Now go to [Google Admin Console](https://admin.google.com) and open the Burger menu on the left. Choose **Security** > **API controls**.

Get the Service account with the ID provided before (Service account details), then add the following oauth scopes:
```
https://www.googleapis.com/auth/admin.directory.user, https://www.googleapis.com/auth/admin.directory.userschema, https://www.googleapis.com/auth/admin.directory.group, https://www.googleapis.com/auth/apps.groups.settings
```

### Provide Service account credentials to Terraform

Add credentials to terraform.tfvars, see [terraform.tfvars.example](terraform.tfvars.example).
