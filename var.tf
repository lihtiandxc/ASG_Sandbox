variable "tags" {
  default = {
    service = "itachi"
  }
}

variable "name" {
  default {
    ec2_itachi = "itachi01-virtual-server"
    ec2_itachi2 = "itachi02-virtual-server"
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
