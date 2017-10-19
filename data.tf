#iam user policy
data "template_file" "iam_user_itach001_policy" {
  template = "${file("iam_user_itach001_policy.json")}"
}
