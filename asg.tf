resource "aws_launch_configuration" "sample" {
  name          = "itachi-template-autoscaling-lc"
  image_id      = "${data.aws_ami.amazon.id}"
  instance_type = "t2.micro"

  lifecycle = {
    ignore_changes = [
      "image_id",
    ]
  }
}

resource "aws_autoscaling_group" "itachi" {
  name                      = "${var.name["ec2_itachi"]}-autoscaling"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.sample.name}"
  vpc_zone_identifier       = ["${element(var.private, 0)}", "${element(var.private, 1)}"]

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]

  load_balancers = ["${aws_elb.itachi.id}"]

  tag {
    key                 = "Service"
    value               = "${var.tags["service"]}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${var.name["ec2_itachi"]}-autoscaling"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_policy" "out_itachi" {
  name                   = "${aws_autoscaling_group.itachi.name}-scaleout-by-metrics"
  scaling_adjustment     = 2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.itachi.name}"
}

resource "aws_autoscaling_policy" "in_itachi" {
  name                   = "${aws_autoscaling_group.itachi.name}-scalein-by-metrics"
  scaling_adjustment     = -2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.itachi.name}"
}


