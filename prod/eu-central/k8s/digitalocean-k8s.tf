data "sops_file" "argocd_values" {
  source_file = "${path.module}/helm-values/argocd.enc.yaml"
}

data "sops_file" "sops_age_key" {
  source_file = "${path.module}/sops-keys/age-key.enc.yaml"
}

module "do_cluster" {
  source = "github.com/SayHeyD/terraform-modules/packages/do-cluster"

  do_token = var.do_token
  cluster_name = "prod-eu-001"
  region = var.region

  maintenance_policy = {
    day = "monday"
    start_time = "03:00"
  }

  node_pools = [
    {
      name = "workers"
      size = "s-2vcpu-4gb"
      node_count = 1

      auto_scale = null
      min_nodes = null
      max_nodes = null
      tags = null
      labels = null

      taint = null
    }
  ]

  acme_registration_email = "david@docampo.ch"

  argocd_helm_values_files = [
    "${data.sops_file.argocd_values.raw}"
  ]

  app_project_name = "infrastructure"

  application_name = "apps"
  application_namespace = "argocd"

  https_repo_url = "https://github.com/sayheyd/kube-helm-charts.git"
  target_revision = "main"
  applicaiton_path = "argocd-apps"

  application_destination_namespace = "argocd"

  sops_age_key = "${data.sops_file.sops_age_key.raw}"
}