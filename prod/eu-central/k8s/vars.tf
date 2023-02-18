variable "do_token" {
  type = string
  description = "DigitalOcean API token"
  nullable = false
}

variable "region" {
  type = string
  description = "region of the k8s cluster"
  nullable = false
}