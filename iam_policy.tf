resource "aws_iam_user_policy" "itachi001" {
  name   = "${var.name["iam_user_itach001_s3_policy"]}"
  user   = "itachi001"
  policy = "${data.template_file.iam_user_itachi001_s3_policy.rendered}"
}
