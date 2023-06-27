terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.58.0"
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
  region = "us-west-2"
}

resource "aws_organizations_organization" "audiotube" {
  feature_set = "ALL"
}

# Create a new OU for environment accounts
resource "aws_organizations_organizational_unit" "environments" {
  name      = "environments"
  parent_id = aws_organizations_organization.audiotube.roots[0].id
}

# Create a new AWS account called "dev"
resource "aws_organizations_account" "dev" {
  name              = "dev"
  email             = lookup(var.account_emails, "dev")
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.environments.id
  close_on_deletion = true
  depends_on        = [aws_organizations_organization.audiotube]
}

# Create a new AWS account called "test"
resource "aws_organizations_account" "test" {
  name              = "test"
  email             = lookup(var.account_emails, "test")
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.environments.id
  close_on_deletion = true
  depends_on        = [aws_organizations_organization.audiotube]
}

# Create a new AWS account called "prod"
resource "aws_organizations_account" "prod" {
  name              = "prod"
  email             = lookup(var.account_emails, "prod")
  role_name         = var.iam_account_role_name
  parent_id         = aws_organizations_organizational_unit.environments.id
  close_on_deletion = true
  depends_on        = [aws_organizations_organization.audiotube]
}
