module "k8s" {
  source = "./k8s"

  do_token = var.do_token
  region = "fra1"
}