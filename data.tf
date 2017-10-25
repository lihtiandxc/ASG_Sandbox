#iam user policy
data "template_file" "itachi001_policy" {
  template = "${file("itachi001_policy.json")}"
}

data "template_file" "itachi003_policy" {
  template = "${file("itachi003_policy.json")}"
}

data "template_file" "itachi004_policy" {
  template = "${file("itachi004_policy.json")}"
}

