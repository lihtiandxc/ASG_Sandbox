resource "aws_iam_policy_attachment" "itachi001-attach" {
  name       = "itachi001-attachment"
#  users      = ["${aws_iam_user.user.name}"]
   users      = "${var.name["iam_user_itach001"]}"
#  roles      = ["${aws_iam_role.role.name}"]
#  groups     = ["${aws_iam_group.group.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}
