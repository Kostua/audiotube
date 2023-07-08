variable "iam_account_role_name" {
  type        = string
  description = "The name of an IAM role that Organizations automatically preconfigures in the new member account. "
  default     = "Org-Admin"
}
variable "account_emails" {
  type        = map(any)
  description = "Map of workspace names to email addresses for AWS accounts"
  default = {
    audiotube-org                    = "audiotube-org@cloudsbits.com",
    audiotube-security-prod          = "audiotube-security-prod@cloudsbits.com",
    audiotube-sandbox                = "audiotube-sandbox@cloudsbits.com",
    audiotube-workloads-prod         = "audiotube-workloads-prod@cloudsbits.com",
    audiotube-workloads-preprod      = "audiotube-workloads-preprod@cloudsbits.com",
    audiotube-infrastructure-prod    = "audiotube-infrastructure-prod@cloudsbits.com",
    audiotube-infrastructure-preprod = "audiotube-infrastructure-preprod@cloudsbits.com",
  }
}
