variable "instance_type" {
  default = {
    itachi    = "t2.micro"
  }
}

resource "aws_instance" "itachi" {
  ami                     = "${data.aws_ami.amazon.id}"
  instance_type           = "${var.instance_type["itachi"]}"
  disable_api_termination = "true"
  key_name                = "ec2_user"

  vpc_security_group_ids = ["${var.sg["itachi"]}" ]
  

  subnet_id            = "${element(var.private, 1)}"
  iam_instance_profile = "${var.iam_role["itachi"]}"

  tags {
    Name = "${var.name["ec2_itachi"]}"
    Service = "${var.tags["service"]}"

  }

  root_block_device {
    volume_type = "gp2"
    volume_size = "8"
  }

  lifecycle {
    ignore_changes = ["ami"]
  }
}
