provider "intersight" {
  apikey    = var.api_key
  secretkey = var.secretkey
  endpoint  = var.endpoint
}

module "terraform-intersight-iks" {
  #vsource = "terraform-cisco-modules/iks/intersight//modules/terraform-intersight-iks/"
  # source = "terraform-cisco-modules/iks/intersight//"
  # Infra Config Policy Information
  source = "terraform-cisco-modules/iks/intersight//modules/terraform-intersight-iks/"
  cluster_name = "cluster"
  cluster_action = "Deploy"
  vc_target_name   = "10.88.166.174"
  vc_portgroup     = ["VM Network"]
  vc_datastore     = "secTMPHEB"
  vc_cluster       = "prod"
  vc_resource_pool = ""
  vc_password      = var.vc_password

  # IP Pool Information
  ip_starting_address = "10.139.120.220"
  ip_pool_size        = "20"
  ip_netmask          = "255.255.255.0"
  ip_gateway          = "10.139.120.1"
  ip_primary_dns      = "10.101.128.15"
  ip_secondary_dns    = "10.101.128.16"

  # Network Configuration Settings
  # pod_cidr = "100.65.0.0/16"
  # service_cidr = "100.64.0.0/24"
  # cni = "Calico"
  domain_name         = "rich.ciscolabs.com"
  timezone            = "America/New_York"
  unsigned_registries = ["10.101.128.128"]
  # root_ca_registries  = [""]

  # Cluster information
  ssh_user     = var.ssh_user
  ssh_key      = var.ssh_key
  worker_size  = "small"
  worker_count = 4
  master_count = 1
  load_balancers = 3
  # Organization and Tag
  organization = var.organization
  tags         = var.tags
}
