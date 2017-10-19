provider "aws" {
  region     = "ap-southeast-1"
}

variable "tags" {
  default = {
    service = "itachi"
  }
}

variable "name" {
  default {
    ec2_itachi = "itachi01-virtual-server"
    rds_boss = "itachi101-rds-mysql"
    rds_replica_boss = "itachi102-rds-mysql"
    itach001_s3_policy = "itachi001_policy" 
    iam_user_itachi001 = "itachi001"
  }
}

variable "private" {

  default = [
    "subnet-f39e6094",
    "subnet-16d0325f",
  ]
}

variable "sg" {
  default {
    itachi = "sg-43984d25"
    }
  }

variable "iam_role" {
   default {
     itachi = "fr-stg-design03-role"
     }
  }

variable "mysql_boss" {
  default = {
    storage            = 100
    engine             = "MySQL"
    version            = "5.7.17"
    backup_window      = "15:00-16:00"
    maintenance_window = "Sat:17:00-Sat:18:00"
  }
}
