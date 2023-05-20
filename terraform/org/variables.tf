variable "iam_account_role_name" {
  type        = string
  description = "Name of the IAM role to be created in each account"
  default     = "Org-Admin"
}

variable "account_emails" {
  type        = map(string)
  description = "Map of account emails for dev, test, and prod environments"
  default = {
    dev  = "cb-audiotube+dev@cloudsbits.com"
    test = "cb-audiotube+test@cloudsbits.com"
    prod = "cb-audiotube+prod@cloudsbits.com"
  }
}