variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "subnet_id_1" {
  type    = string
  default = "subnet-0c0612168b115109c"
}

variable "subnet_id_2" {
  type    = string
  default = "subnet-02a276f673b1196d6"
}

variable "eks_version" {
  type    = string
  default = "1.23"
}

variable "eks_cluster_name" {
  type    = string
  default = "demo-eks-cluster"
}

variable "eks_node_groupname" {
  type    = string
  default = "demo-eks-nodegroup"
}

variable "node_instance_type" {
  type    = string
  default = "t2.medium"
}




