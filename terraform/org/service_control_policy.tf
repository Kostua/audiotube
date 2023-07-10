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

data "aws_iam_policy_document" "deny_leave_org_policy" {
  statement {
    effect = "Deny"
    actions = [
      "organizations:LeaveOrganization"
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

resource "aws_organizations_policy" "deny_leave_org" {
  name        = "Deny Leave Organization"
  description = "Denies leaving the organization"
  type        = "SERVICE_CONTROL_POLICY"
  content     = data.aws_iam_policy_document.deny_leave_org_policy.json
}

resource "aws_organizations_policy_attachment" "sandbox" {
  policy_id = aws_organizations_policy.cloudtrail_config_policy.id
  target_id = aws_organizations_organization.audiotube.roots[0].id
}

resource "aws_organizations_policy_attachment" "deny_leave_org_attachment" {
  policy_id = aws_organizations_policy.deny_leave_org.id
  target_id = aws_organizations_organization.audiotube.roots[0].id
}