

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