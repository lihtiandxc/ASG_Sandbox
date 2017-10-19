terraform {
  backend "s3" {
    bucket = "s3-putty-log-001"
    key    = "tfstate/test1.tfstate"
    region = "ap-southeast-1"
  }
}

