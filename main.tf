terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "/"
    region = "eu-central-2"
  }
}

module "prod" {
  source = "./prod"

  do_token = var.do_token
}
