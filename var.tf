variable "tags" {
  default = {
    service = "itachi"
  }
}

variable "name" {
  default {
    ec2_itachi               = "itachi01-virtual-server"
  }
}

variable "private" {

  default = [
    "subnet-f39e6094",
    "subnet-16d0325f",
  ]
}
