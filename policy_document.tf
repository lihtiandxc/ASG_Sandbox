data "aws_iam_policy_document" "itachi002" {
  statement {
    actions = ["s3:ListAllMyBuckets",]
    resources = ["arn:aws:s3:::*",]
  }

  statement {
    actions = [
        "s3:ListBucket",
        "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::arn:aws:s3:::s3-putty-log-001",
    ]
  }

  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::arn:aws:s3:::s3-putty-log-001",
      "arn:aws:s3:::arn:aws:s3:::s3-putty-log-001/*",
    ]
  }
}
