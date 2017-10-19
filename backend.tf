terraform {
  backend "s3" {
    bucket = "s3-putty-log-001"
    key    = "tfstate/itachi.tfstate"
    region = "ap-southeast-1"
  }
}

