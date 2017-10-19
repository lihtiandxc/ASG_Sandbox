resource "aws_iam_user" "itach001" {
  name = "${var.name["iam_user_itach001"]}"
}
