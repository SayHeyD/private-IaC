terraform {
  backend "s3" {
    bucket = "docmapo-private-terraform-state"
    key = "terraform-state"
    region = "eu-central-2"
    
    # Currently the eu-central-2 (Zürich) region is not accepted as a valid region by the s3 backend
    skip_region_validation = true
  }
}

module "prod" {
  source = "./prod"

  do_token = var.do_token
}
