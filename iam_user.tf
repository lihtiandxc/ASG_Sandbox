### Problem ###

resource "aws_iam_user" "itachi001" {
  name = "${var.name["iam_user_itachi001"]}"
}

resource "aws_iam_policy" "policy_itachi001v2" {
  name        = "policy_itachi002"
  path        = "/"
  description = "My test policy"
  policy      = "${data.template_file.itachi001_policy.rendered}"
}

resource "aws_iam_policy" "policy_itachi002" {
  name        = "policy_itachi002"
  path        = "/"
  description = "My test document policy"
  policy      = "${data.aws_iam_policy_document.itachi002.json}"
}

#resource "aws_iam_user_policy_attachment" "test-attach" {
#    user       = "${aws_iam_user.itachi001.name}"
#    policy_arn = "${aws_iam_policy.policy_itachi001.arn}"
#}

