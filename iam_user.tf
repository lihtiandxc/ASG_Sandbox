### Problem ###

resource "aws_iam_user" "itachi001" {
  name = "${var.name["iam_user_itachi001"]}"
}

resource "aws_iam_access_key" "itachi001" {
  user = "${aws_iam_user.itachi001.id}"
}

resource "aws_iam_policy" "policy_itachi001v2" {
  name        = "policy_itachi001v2"
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

resource "aws_iam_policy" "policy_itachi003" {
  name        = "policy_itachi003_console"
  path        = "/"
  description = "My test document policy"
  policy      = "${data.template_file.itachi003_policy.rendered}"
}

resource "aws_iam_policy" "policy_itachi004" {
  name        = "policy_itachi004_console"
  path        = "/"
  description = "My test document policy"
  policy      = "${data.template_file.itachi004_policy.rendered}"
}

resource "aws_iam_user_policy_attachment" "test-attach" {
    user       = "${aws_iam_user.itachi001.id}"
    policy_arn = "${aws_iam_policy.policy_itachi004.arn}"
}

