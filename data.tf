#iam user policy
data "template_file" "itachi001_policy" {
  template = "${file("itachi001_policy.json")}"
}
