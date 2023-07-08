terraform {
  required_version = "= 1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.7.0"
    }
  }
  cloud {
    organization = "cloudsbits"
    workspaces {
      name = "audiotube-org"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}
resource "aws_organizations_organization" "audiotube" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "sso.amazonaws.com",
  ]
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = aws_organizations_organization.audiotube.roots[0].id
}

resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox"
  parent_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = aws_organizations_organization.audiotube.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads_prod" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_organizational_unit" "workloads_preprod" {
  name      = "Preprod"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = "Infrastructure"
  parent_id = aws_organizations_organization.audiotube.roots[0].id
}

resource "aws_organizations_organizational_unit" "infrastructure_prod" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.infrastructure.id
}

resource "aws_organizations_organizational_unit" "infrastructure_preprod" {
  name      = "Preprod"
  parent_id = aws_organizations_organizational_unit.infrastructure.id
}

resource "aws_organizations_account" "audiotube_security_prod" {
  name              = "audiotube-security-prod"
  email             = var.account_emails["audiotube-security-prod"]
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.prod.id
  close_on_deletion = true
}

resource "aws_organizations_account" "audiotube_sandbox" {
  name              = "audiotube-sandbox"
  email             = var.account_emails["audiotube-sandbox"]
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.sandbox.id
  close_on_deletion = true
}

resource "aws_organizations_account" "audiotube_workloads_prod" {
  name              = "audiotube-workloads-prod"
  email             = var.account_emails["audiotube-workloads-prod"]
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.workloads_prod.id
  close_on_deletion = true
}

resource "aws_organizations_account" "audiotube_workloads_preprod" {
  name              = "audiotube-workloads-preprod"
  email             = var.account_emails["audiotube-workloads-preprod"]
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.workloads_preprod.id
  close_on_deletion = true
}

resource "aws_organizations_account" "audiotube_infrastructure_prod" {
  name              = "audiotube-infrastructure-prod"
  email             = var.account_emails["audiotube-infrastructure-prod"]
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.infrastructure_prod.id
  close_on_deletion = true
}

resource "aws_organizations_account" "audiotube_infrastructure_preprod" {
  name              = "audiotube-infrastructure-preprod"
  email             = var.account_emails["audiotube-infrastructure-preprod"]
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.infrastructure_preprod.id
  close_on_deletion = true
}
