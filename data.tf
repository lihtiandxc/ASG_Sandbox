#iam user policy
data "template_file" "itach001_policy" {
  template = "${file("itach001_policy.json")}"
}
