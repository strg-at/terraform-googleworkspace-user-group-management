variable "impersonated_user_email" {
  type        = string
  default     = null
  description = "impersonated user account for GSuite domain-wide delegation"
}

variable "credentials" {
  type        = string
  default     = null
  description = "links to google credentials for service account"
}
