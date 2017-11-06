resource "aws_iam_role_policy" "aism" {
  name   = "${var.name["ec2_role_s3_policy"]}"
  role   = "ec2-s3-RO-access"
  policy = "${data.template_file.ec2_role_s3_policy.rendered}"
}
