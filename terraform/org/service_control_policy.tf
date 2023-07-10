data "aws_iam_policy_document" "block_cloudtrial_configuration_policy" {
  statement {
    effect = "Deny"
    actions = [
      "cloudtrail:AddTags",
      "cloudtrail:CreateTrail",
      "cloudtrail:DeleteTrail",
      "cloudtrail:RemoveTags",
      "cloudtrail:StartLogging",
      "cloudtrail:StopLogging",
      "cloudtrail:UpdateTrail"
    ]
    resources = ["*"]
  }
}

resource "aws_organizations_policy" "cloudtrail_config_policy" {

  description = "Blocks CloudTrail configuration actions"
  name        = "Block CloudTrail Configuration Actions"
  type        = "SERVICE_CONTROL_POLICY"
  content     = data.aws_iam_policy_document.block_cloudtrial_configuration_policy.json
}

resource "aws_organizations_policy_attachment" "sandbox" {
  policy_id = aws_organizations_policy.cloudtrail_config_policy.id
  target_id = aws_organizations_account.audiotube_sandbox.id
}