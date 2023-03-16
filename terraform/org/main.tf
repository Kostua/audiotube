provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = "~> 4.0"
  }
  cloud {
    organization = "cloudsbits"

    workspaces {
      name = "audiotube-org"
    }
  }
}

resource "aws_organizations_organization" "audiotube" {
  feature_set = "ALL"
}