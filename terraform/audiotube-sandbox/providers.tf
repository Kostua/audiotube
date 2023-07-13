module "org" {
  source = "../org"

}

provider "aws" {
  alias = "audiotube-sandbox"

  assume_role {
    role_arn = "arn:aws:iam::${module.org.audiotube_sandbox_account_id}:role/${var.iam_account_role_name}"
  }
}
