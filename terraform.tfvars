region           = "us-east-1"
cluster_name     = "eks-tf-spacelift"
vpc_id           = "vpc-0e1e77c63e090154c"
subnet_ids       = ["subnet-0c10d394356acb8ff", "subnet-0cd89db6e369021fa"]
cluster_version  = "1.33"
node_group_name  = "system-ng"
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
