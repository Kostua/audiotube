data "terraform_remote_state" "org" {
  backend = "remote"
  config = {
    organization = "cloudsbits"
    workspaces = {
      name = "audiotube-org"
    }
  }
}

provider "aws" {

  assume_role {
    role_arn = "arn:aws:iam::${data.terraform_remote_state.org.outputs.audiotube_sandbox_account_id}:role/${data.terraform_remote_state.org.outputs.iam_account_role_name}"
  }
}
