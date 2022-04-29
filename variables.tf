variable "vpc_id" {
  type    = string
  default = "vpc-0f82992e109fea8f9"
}

variable "subnet_id" {
  type    = string
  default = "subnet-039d7bd1c43f973cc"
}
variable "cluster_name" {
  type    = string
  default = "eks-kubeginners-jenkins"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
