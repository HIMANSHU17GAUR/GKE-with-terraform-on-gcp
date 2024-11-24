subnet_name        = "my-custom-subnet-with-ranges"
vpc_name           = "default"
project_id         = "vertical-gift-423404-q8"
network_project_id = "vertical-gift-423404-q8"
region             = "us-central1"


name = "higa-ul-poc-gke-test-1"
cluster_resource_labels = {
  cluster-name          = "gke-higa-poc-1"
  type                  = "enterprise"
  env                   = "test"
  virtualization-status = "disabled"
}
master_authorized_networks = [
  /*
  {
    cidr_block   = "34.126.107.54/32"
    display_name = "mac"
  },
  */
  {
    cidr_block   = "10.128.0.0/20"
    display_name = "jump-node"
  }
]
kubernetes_version                    = "latest"
release_channel                       = "REGULAR"
horizontal_pod_autoscaling            = true
enable_vertical_pod_autoscaling       = false
create_service_account                = false
master_ipv4_cidr_block                = "172.16.0.0/28"
ip_range_pods                         = "gke-pods"
ip_range_services                     = "gke-services"
remove_default_node_pool              = true
network_policy                        = false
network_policy_provider               = false
gateway_api_channel                   = "CHANNEL_STANDARD"
enable_intranode_visibility           = true
enable_shielded_nodes                 = true
enable_binary_authorization           = false
fleet_project                         = "vertical-gift-423404-q8"
dns_cache                             = true
monitoring_enable_observability_relay = true
enable_fqdn_network_policy            = false
enable_confidential_nodes             = false
description                           = "General purpose enterprise datalake cluster"
issue_client_certificate              = false
enable_kubernetes_alpha               = false
default_max_pods_per_node             = 110
identity_namespace                    = "enabled"
gce_pd_csi_driver                     = true
gcs_fuse_csi_driver                   = true
filestore_csi_driver                  = false
security_posture_mode                 = "ENTERPRISE"
security_posture_vulnerability_mode   = "VULNERABILITY_ENTERPRISE"
enable_gcfs                           = true
monitoring_enabled_components         = ["SYSTEM_COMPONENTS", "APISERVER", "SCHEDULER", "CONTROLLER_MANAGER", "STORAGE", "HPA", "POD", "DAEMONSET", "DEPLOYMENT", "STATEFULSET", "KUBELET", "CADVISOR", "DCGM"]
logging_enabled_components            = ["SYSTEM_COMPONENTS", "APISERVER", "CONTROLLER_MANAGER", "SCHEDULER", "WORKLOADS"]

node_pools = [
  {
    name                      = "default-higa-us-central1-n-pool"
    machine_type              = "e2-medium"
    node_locations            = "us-central1-a"
    total_min_count           = 1
    total_max_count           = 2
    local_ssd_count           = 0
    preemptible               = false
    local_ssd_ephemeral_count = 0
    disk_size_gb              = 25
    disk_type                 = "pd-standard"
    image_type                = "COS_CONTAINERD"
    enable_gvnic              = false
    auto_repair               = true
    auto_upgrade              = true
    service_account           = "212150173860-compute@developer.gserviceaccount.com"
    location_policy           = "BALANCED"
    enable_secure_boot        = true
  },
  
]

node_pools_oauth_scopes = {
  all = ["https://www.googleapis.com/auth/cloud-platform"]
}

node_pools_labels = {
  default-higa-us-central1-n-pool = {
    "role" = "default"
  }
  
}

node_pools_metadata = {
  all = {
    block-project-ssh-keys = true
  }
}
node_pools_tags = {
  all = [
  ]
}
node_pools_taints = {
  cicd-node-pool = [
    {
      key    = "cicd"
      value  = "true"
      effect = "NO_SCHEDULE"
    }
  ]
  
}

maintenance_start_time       = "2024-10-22T06:00:00Z"
maintenance_end_time         = "2024-10-30T10:00:00Z"
maintenance_recurrence       = "FREQ=WEEKLY;BYDAY=TU,WE,TH"
master_global_access_enabled = true
datapath_provider            = "ADVANCED_DATAPATH"
cluster_autoscaling = {
  enabled             = false
  autoscaling_profile = "OPTIMIZE_UTILIZATION"
  min_cpu_cores       = 1
  max_cpu_cores       = 2
  min_memory_gb       = 1
  max_memory_gb       = 4
  disk_size           = 20
  disk_type           = "pd-standard"
  image_type          = "COS_CONTAINERD"
  gpu_resources       = []
  auto_repair         = true
  auto_upgrade        = true
  machine_type        = "e2-medium"
  min_count           = 1
  max_count           = 3
}
