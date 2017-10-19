resource "aws_iam_user_policy" "itachi001" {
  name   = "${var.name["_user_itach001_s3_policy"]}"
  user   = "itachi001"
  policy = "${data.template_file.itachi001_policy.rendered}"
}
