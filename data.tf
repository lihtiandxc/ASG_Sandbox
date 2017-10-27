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

data "template_file" "ec2_role_s3_policy" {
  template = "${file("policy/ec2_role_s3_policy.json")}"
}
