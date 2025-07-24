variable "cluster_name" { type = string }
variable "region" { type = string }
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "cluster_version" { type = string }
variable "tags" { type = map(string) }
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
