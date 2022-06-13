# -------------------------------------------------------------------------------------------
# CONFIGURE VARIABLES
# -------------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------------
# EXAMPLE
#
# Just an example.
# Will be set to example if not set.
# -------------------------------------------------------------------------------------------

# variable "example" {
#   description = "Just an example."
#   type        = string
#   default     = "example"
#   sensitive   = true
# }

variable "gworkspace_customer_id" {
  type        = string
  default     = null
  description = "customer id of google workspace"
  sensitive   = true
}

variable "gworkspace_email" {
  type        = string
  default     = null
  description = "impersonated user account for GSuite domain-wide delegation"
  sensitive   = true
}

variable "gworkspace_credentials" {
  type        = string
  default     = null
  description = "link to google credentials for service account"
  sensitive   = true
}
