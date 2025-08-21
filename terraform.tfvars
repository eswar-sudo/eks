region           = "us-east-1"
cluster_name     = "spacelift-karpenter"
vpc_id           = "vpc-04f8fda9d23e6309f"
subnet_ids       = ["subnet-0dfe3bdfa325e620d", "subnet-0a57162c47c4e2b82"]
cluster_version  = "1.33"
node_group_name  = "system-ng"
disk_size        = 50
desired_size     = 1
min_size         = 1
max_size         = 3
instance_types   = ["t3.medium"]
capacity_type    = "ON_DEMAND"
ami_type         = "AL2023_x86_64_STANDARD"
vpc_cni_version           = "v1.19.6-eksbuild.1"
coredns_version           = "v1.11.4-eksbuild.2"
kube_proxy_version        = "v1.32.0-eksbuild.2"


labels = {
  nodegroup = "system"
}

tags = {
  Environment = "dev"
  Terraform   = "true"
}
