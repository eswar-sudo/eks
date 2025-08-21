
variable "region" {
  description = "The AWS region to deploy the EKS cluster and associated resources."
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which to deploy the EKS cluster."
  type        = string
}

variable "disk_size" {
  description = "Cluster node disk size"
  type        = number
}

variable "subnet_ids" {
  description = "A list of subnet IDs (private or public) to launch the EKS cluster and node groups."
  type        = list(string)
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS control plane."
  type        = string
}

variable "node_group_name" {
  description = "The name assigned to the EKS node group."
  type        = string
}

variable "desired_size" {
  description = "The desired number of nodes to launch in the node group."
  type        = number
}

variable "min_size" {
  description = "The minimum number of nodes that the node group can scale down to."
  type        = number
}

variable "max_size" {
  description = "The maximum number of nodes that the node group can scale up to."
  type        = number
}

variable "instance_types" {
  description = "A list of EC2 instance types to use for the EKS worker nodes."
  type        = list(string)
}

variable "capacity_type" {
  description = "The capacity type of the nodes. Valid values: ON_DEMAND or SPOT."
  type        = string
}

variable "ami_type" {
  description = "The AMI type for the node group. Examples: AL2_x86_64, AL2_x86_64_GPU, BOTTLEROCKET_x86_64, AL2023_x86_64_STANDARD."
  type        = string
}

variable "labels" {
  description = "A map of Kubernetes labels to apply to the EKS node group."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to apply to all AWS resources created by the module."
  type        = map(string)
}

variable "vpc_cni_version" {
  description = "Version of the VPC CNI add-on"
  type        = string
}

variable "kube_proxy_version" {
  description = "Version of the kube-proxy add-on"
  type        = string
}

variable "coredns_version" {
  description = "Version of the CoreDNS add-on"
  type        = string
}
