provider "aws" {
  region = var.region
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  region          = var.region
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  cluster_version = var.cluster_version
  tags            = var.tags
  vpc_cni_version = var.vpc_cni_version
  kube_proxy_version = var.kube_proxy_version
  coredns_version = var.coredns_version
}

module "nodegroup" {
  source           = "./modules/nodegroup"
  cluster_name     = module.eks.cluster_name
  subnet_ids       = var.subnet_ids
  node_group_name  = var.node_group_name
  node_role_arn    = module.eks.node_role_arn
  desired_size     = var.desired_size
  min_size         = var.min_size
  max_size         = var.max_size
  instance_types   = var.instance_types
  capacity_type    = var.capacity_type
  ami_type         = var.ami_type
  tags             = var.tags
  labels           = var.labels
}
