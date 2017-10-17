variable "rds_subnet" {
  default = "itachi101-rds-subnet"
}


#password
resource "random_id" "boss" {
  byte_length = 8
}

#instances
resource "aws_db_instance" "boss" {
  identifier = "${var.name["rds_boss"]}"
  name       = "${var.tags["service"]}"
  username   = "${var.tags["service"]}"
  password   = "${random_id.boss.hex}"

  vpc_security_group_ids = ["${var.sg["itachi"]}"]

  engine               = "${var.mysql_boss["engine"]}"
  engine_version       = "${var.mysql_boss["version"]}"
## parameter_group_name = "${aws_db_parameter_group.master.id}"

  instance_class            = "db.t2.micro"
  storage_type              = "gp2"
  allocated_storage         = "${var.mysql_boss["storage"]}"
 # multi_az                  = "${var.tags["env"] == "production" ? "true" : "false"}"
  multi_az                  = "false"
  db_subnet_group_name      = "${var.rds_subnet}"
  storage_encrypted         = "false" 
  snapshot_identifier	    = "itachi101-rds-mysql-17102017"
  final_snapshot_identifier = "${var.name["rds_boss"]}-finalsnap"

  auto_minor_version_upgrade = false
  backup_retention_period    = 1
  apply_immediately          = true

  # format: ddd:hh:mm-ddd:hh:mm
  # it need at least 30 minutes
  maintenance_window = "${var.mysql_boss["maintenance_window"]}"

  # format: hh:mm-hh:mm
  backup_window = "${var.mysql_boss["backup_window"]}"

  tags = {
    Service = "${var.tags["service"]}"

  }
}


resource "aws_db_instance" "replica_mysql" {
  identifier = "${var.name["rds_replica_boss"]}"

  vpc_security_group_ids = ["${var.sg["itachi"]}"]

  instance_class       = "db.t2.micro"
  storage_type         = "gp2"
  multi_az             = "false"
  replicate_source_db  = "${aws_db_instance.master.identifier}"
  storage_encrypted    = "false"
  skip_final_snapshot  = true

  auto_minor_version_upgrade = false
  backup_retention_period    = 1
  apply_immediately          = true

  maintenance_window = "${var.mysql_boss["maintenance_window"]}"

  backup_window = "${var.mysql_replica["backup_window"]}"

  tags = {
    Service = "${var.tags["service"]}"
  }
}
