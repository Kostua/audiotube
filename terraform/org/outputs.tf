output "sandbox_output" {
  value       = var.iam_account_role_name
  description = "The name of an IAM role to assume in each account"
}

output "audiotube_sandbox_account_id" {
  value       = aws_organizations_account.audiotube_sandbox.id
  description = "The AWS account ID of the audiotube-sandbox account."
}

output "audiotube_security_prod_account_id" {
  value       = aws_organizations_account.audiotube_security_prod.id
  description = "The AWS account ID of the audiotube-security-prod account."
}

output "audiotube_workloads_prod_account_id" {
  value       = aws_organizations_account.audiotube_workloads_prod.id
  description = "The AWS account ID of the audiotube-workloads-prod account."
}

output "audiotube_workloads_preprod_account_id" {
  value       = aws_organizations_account.audiotube_workloads_preprod.id
  description = "The AWS account ID of the audiotube-workloads-preprod account."
}

output "audiotube_infrastructure_prod_account_id" {
  value       = aws_organizations_account.audiotube_infrastructure_prod.id
  description = "The AWS account ID of the audiotube-infrastructure-prod account."
}

output "audiotube_infrastructure_preprod_account_id" {
  value       = aws_organizations_account.audiotube_infrastructure_preprod.id
  description = "The AWS account ID of the audiotube-infrastructure-preprod account."
}