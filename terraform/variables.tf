variable "aws_region" {
  default = "us-west-2"
}

variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "node_group_name" {
  default = "my-eks-nodes"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 4
}

variable "min_size" {
  default = 1
}

variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
