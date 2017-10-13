data "aws_acm_certificate" "domain" {
  domain = "lihtian.com"
}

resource "aws_elb" "itachi" {
  name = "${var.name["ec2_itachi"]}"

  subnets = [
    "${element(var.private, 0)}",
    "${element(var.private, 1)}",
  ]

  security_groups = ["${var.sg["itachi"]}"]

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${data.aws_acm_certificate.domain.arn}"
  }

  health_check {
    target              = "HTTP:80/status.html"
    timeout             = 5
    interval            = 30
    unhealthy_threshold = 2
    healthy_threshold   = 10
  }

  instances                   = ["${aws_instance.itachi.id}"]
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 300

  tags {
    # format: domain%02d
    Name    = "${var.name["ec2_itachi"]}"
    Service = "${var.tags["service"]}"

  }
}
