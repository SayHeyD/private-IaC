output "digitalocean_k8s" {
  value = module.do_cluster
  sensitive = true
}