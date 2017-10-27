resource "aws_s3_bucket" "aism" {
  # format: brand-domain-region-service-role
  # e.g. uq-production-tky-account-web
  bucket = "${var.name["s3_aism"]}"

  region = "${var.region["asia"]}"

  /* when it is production elb, you must enable logging
        logging {
          target_bucket = "${var.s3_access_log}"
          target_prefix = "${var.tags["service"]}/S3/${var.name["s3"]}/"
        }
*/

/*  tags {
    Name    = "${var.name["s3_aism"]}"
    Service = "${var.tags["service"]}"
    Env     = "${var.tags["env"]}"
    Brand   = "${var.tags["brand"]}"
    Country = "${var.tags["country"]}"
  }*/
}
