# EKS Cluster with Node Group using Terraform

This project provides a modular, production-ready setup for deploying an **Amazon EKS Cluster** and its associated **Node Group** using Terraform. The configuration supports separate modules for cluster and node group, uses IAM best practices, and provides customization via variables.

---

## 📁 Structure

```
eks-cluster/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
│
├── modules/
│   ├── eks/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── nodegroup/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```

---

## 🚀 Getting Started

### 1. Customize your inputs in `terraform.tfvars`:

```hcl
region           = "us-east-1"
cluster_name     = "demo-eks-cluster"
vpc_id           = "vpc-xxxxxxxx"
subnet_ids       = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
cluster_version  = "1.29"
node_group_name  = "system-ng"
desired_size     = 2
min_size         = 1
max_size         = 3
instance_types   = ["t3.medium"]
capacity_type    = "ON_DEMAND"
ami_type         = "AL2_x86_64"

labels = {
  nodegroup = "system"
}

tags = {
  Environment = "dev"
  Terraform   = "true"
}
```

---

### 2. Initialize and Deploy

```bash
terraform init
terraform plan
terraform apply
```

---

## 🧱 Modules Overview

### `eks` Module

- Provisions the EKS cluster
- Creates the required IAM roles
- Attaches `AmazonEKSClusterPolicy` and node IAM policies

### `nodegroup` Module

- Provisions a managed node group for the EKS cluster
- Configures scaling, capacity type, instance types
- Applies Kubernetes labels and AWS tags

---

## 🔐 IAM Policies Used

For the EKS Cluster Role:
- `AmazonEKSClusterPolicy`

For the Node Group Role:
- `AmazonEKSWorkerNodePolicy`
- `AmazonEKS_CNI_Policy`
- `AmazonEC2ContainerRegistryReadOnly`
- `AmazonSSMManagedInstanceCore`

---

## 📤 Outputs

Each module exposes useful outputs:
- `cluster_name`
- `cluster_endpoint`
- `node_group_name`
- `node_group_arn`
- `node_role_arn`

---

## 📝 Notes

- You must have an existing VPC and subnets (preferably private) for this setup.
- Kubernetes config will need to be updated manually using:
```bash
aws eks update-kubeconfig --region <region> --name <cluster_name>
```

---

## 📎 License

This project is licensed under the MIT License.
